import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_ble_ots/src/models/oacp_features.dart';
import 'package:flutter_ble_ots/src/models/object_properties.dart';
import 'package:flutter_ble_ots/src/models/olcp_response.dart';

import '../flutter_ble_ots.dart';
import 'bluetooth_controller.dart';
import 'data_transformer.dart';
import 'models/oacp_response.dart';
import 'models/olcp_features.dart';
import 'models/ots_features.dart';
import 'oacp_constants.dart';
import 'oacp_op_code_utils.dart';
import 'olcp_constants.dart';
import 'olcp_op_code_utils.dart';

class ObjectTransferProtocol {
  final Map<List<int>, ObjectMetaData> _knownMetaData = {};

  final String _deviceId;
  final BleDeviceInteractor _ble;
  final void Function(String message) _logMessage;
  late final BluetoothController _controller;
  final MetaDataUuids _metaDataUuids;
  final String Function(Uint8List uuid)? _getNameFromUuid;

  ObjectTransferProtocol(this._ble, this._deviceId, this._logMessage,
      this._metaDataUuids, this._getNameFromUuid) {
    _controller =
        BluetoothController(_ble, _deviceId, _metaDataUuids, _logMessage);
  }

  Future<OtsFeatures?> discoverFeatures(
      {CommonConnectionPriority? priority}) async {
    try {
      if (Platform.isAndroid && priority != null) {
        await _ble.requestConnectionPriority(priority, _deviceId);
      }
      const oacpLowerBound = 0;
      const oacpUpperBound = 4;
      const olcpLowerBound = 4;
      const olcpUpperBound = 8;

      final readResponse = await _controller
          .readCharacteristic(_metaDataUuids.featureDiscoveryUuid);

      final oacp = OACPFeatures.fromList(
          readResponse.sublist(oacpLowerBound, oacpUpperBound));
      final olcp = OLCPFeatures.fromList(
          readResponse.sublist(olcpLowerBound, olcpUpperBound));
      return OtsFeatures(oacpFeatures: oacp, olcpFeatures: olcp);
    } catch (e) {
      _logMessage('discoverFeatures: $e');
    }

    return null;
  }

  void observeServiceId(Uint8List serviceUuid) {
    _controller.observeCustomServiceId(serviceUuid);
  }

  Future<List<int>> waitForCustomUuidChanged(
          Uint8List serviceUuid, DateTime afterTime) =>
      _controller.getLastResponseOfCustomServiceId(
        serviceUuid,
        afterTime,
      );

  Future<ObjectMetaData?> _gotoObjectAndReadMetaData(List<int> id) async {
    try {
      _logMessage('goto id $id');
      final command =
          OlcpOpCodeUtils.getOLCPAsByteArray(OLCPConstants.GO_TO, id);
      final writeSuccess = await _controller.writeCharacteristic(
          _metaDataUuids.olcpUuid, command);
      if (writeSuccess) {
        if (_knownMetaData.containsKey(id)) {
          return _knownMetaData[id];
        }
        final metaData = await _getMetaDataOfCurrentObject();
        _knownMetaData[id] = metaData;
        return metaData;
      }
    } catch (e) {
      _logMessage('_gotoObjectAndReadMetaData: $e');
    }
    return null;
  }

  String toHex(List<int> input) {
    return input.map((i) => i.toRadixString(16).padLeft(2, '0')).join();
  }

  Future<ObjectMetaData> _getMetaDataOfCurrentObject() async {
    final objectId =
        await _controller.readCharacteristic(_metaDataUuids.objectIdUuid);
    final objectName = BluetoothUtils.getStringFromTransmittedCharArray(
        await _controller.readCharacteristic(_metaDataUuids.objectNameUuid));
    final objectSize =
        await _controller.readCharacteristic(_metaDataUuids.objectSizeUuid);
    final objectProperties = ObjectProperties.fromByteArray(await _controller
        .readCharacteristic(_metaDataUuids.objectPropertiesUuid));
    final objectType =
        await _controller.readCharacteristic(_metaDataUuids.objectTypeUuid);
    _logMessage(
        'new meta data: id: ${toHex(objectId)} name: $objectName size: ${toHex(objectSize)}');
    return ObjectMetaData(
        id: objectId,
        size: objectSize,
        name: objectName,
        type: objectType,
        objectProperties: objectProperties);
  }

  Future<bool> _createObjectWithId(List<int> id, int size) async {
    try {
      _logMessage('Creating object with ID $id and size $size');

      final sizeBytes = ByteData(4)..setUint32(0, size, Endian.little);

      // Use a dummy type UUID if you don’t have a specific one
      const typeUuid = [0xED, 0xFE]; // 0xFEED in little-endian

      final command = <int>[
        0x01, // CREATE opcode
        ...sizeBytes.buffer.asUint8List(),
        ...typeUuid,
      ];

      final success = await _controller.writeCharacteristic(
        _metaDataUuids.oacpUuid,
        command,
      );

      if (!success) {
        _logMessage('Failed to write CREATE command');
        return false;
      }

      return true;
    } catch (e) {
      _logMessage('Error during object creation: $e');
      return false;
    }
  }

  Future<bool> _writeCurrentObject(
    OACPFeatures oacpFeatures,
    ObjectMetaData currentObjectMetaData,
    List<int> input, [
    int offset = 0,
  ]) async {
    try {
      if (!_isWriteAllowed(oacpFeatures, currentObjectMetaData)) {
        return false;
      }
      _logMessage('writeCurrentObject: $input offset: $offset');
      final bytesTransmitted =
          await _sendData(input, offset, currentObjectMetaData);
      _logMessage('bytesTransmitted: $bytesTransmitted');
      if (bytesTransmitted != input.length) {
        _logMessage(
            'transmitted $bytesTransmitted, but input has length ${input.length}');
        return false;
      }
      return true;
    } catch (e) {
      _logMessage('_writeCurrentObject: $e');
    }

    return false;
  }

  Future<int> _sendData(
      List<int> data, int offset, ObjectMetaData currentObjectMetaData) async {
    if (data.isEmpty) {
      throw Exception('EmptyTransmissionDataException()');
    }

    try {
      final socketId = await _ble.createL2CapChannel(0x25, _deviceId);

      if (socketId == null) {
        throw Exception('L2CapChannelCreationException()');
      }

      // final mtu = await _ble.requestMtu(OtpBleConstants.MAX_MTU, _deviceId);
      // final toTransmit =
      //     Utils.splitArrayIntoChunks(data, OtpBleConstants.MAX_BULK_WRITE_SIZE);

      final oacpCommand = OacpOpCodeUtils.getWriteRequest(
        offset,
        data.length,
        OacpOpCodeUtils.getModeByte(false),
      );

      _logMessage('oacpCommand $oacpCommand');

      final oacpResponse = await _sendOacpCommand(oacpCommand);

      if (oacpResponse == null ||
          oacpResponse.resultCode != OACPConstants.SUCCESS) {
        throw Exception('OacpResponseException()');
      }

      final success = await _ble.l2CapWrite(socketId, _deviceId, data);
      _logMessage('send data $success');

      final closed = await _ble.closeL2CapChannel(socketId, _deviceId);

      if (!closed) {
        _logMessage('closed');
        throw Exception('L2CapChannelCloseException()');
      }

      return data.length;
    } catch (e) {
      _logMessage('_sendData: $e');
    }

    return -1;
  }

  Future<bool> _sendDataChunk(List<int> payload) async {
    try {
      final writeResponse = await _controller.writeCharacteristic(
          _metaDataUuids.transmissionUuid, payload);

      if (writeResponse) {
        return true;
      } else {
        throw Exception('GattResponseException(writeResponse)');
      }
    } catch (e) {
      _logMessage('_sendDataChunk: $e');
    }

    return false;
  }

  Future<bool> selectObjectId(List<int> id) async {
    try {
      _logMessage('Selecting object with ID: ${toHex(id)}');

      final command =
          OlcpOpCodeUtils.getOLCPAsByteArray(OLCPConstants.SELECT, id);

      // This should write to OLCP characteristic, not OACP
      final response = await _sendOlcpCommand(command);

      if (response != null && response.resultCode == OACPConstants.SUCCESS) {
        _logMessage('Object selected successfully');
        return true;
      } else {
        _logMessage('Failed to select object: ${response?.resultCode}');
      }
    } catch (e) {
      _logMessage('Error selecting object: $e');
    }

    return false;
  }

  Future<List<int>?> _readCurrentObject(
    OACPFeatures oacpFeatures,
    ObjectMetaData currentObjectMetaData,
  ) async {
    if (!_isReadAllowed(oacpFeatures, currentObjectMetaData)) {
      return null;
    }

    final size =
        DataTransformer.getCurrentSizeFromByteArray(currentObjectMetaData.size);
    var offset = 0;
    var failCounter = 0;
    var finished = false;
    final List<int> object = [];

    final socketId = await _ble.createL2CapChannel(0x25, _deviceId);

    if (socketId == null) {
      throw Exception('L2CapChannelCreationException()');
    }

    while (!finished) {
      final chunk = await _getNextDataChunk(offset, size, socketId);
      final newOffset = offset + chunk.length;
      if (newOffset == offset) {
        failCounter++;
      } else {
        offset = newOffset;
      }

      if (failCounter == 3) {
        throw Exception(
            'CommunicationException("read", $currentObjectMetaData)');
      }

      finished = (offset == size) || chunk.isEmpty;
      object.addAll(chunk);
    }

    final success = await _ble.closeL2CapChannel(socketId, _deviceId);

    if (!success) {
      throw Exception('CommunicationException("read", $currentObjectMetaData)');
    }

    _logMessage(
        'read object $object with size $size meta: $currentObjectMetaData');
    return object;
  }

  Future<List<int>> _getNextDataChunk(
      int offset, int size, String socketId) async {
    // int mtu =
    //     await _ble.requestMtu(OtpBleConstants.MAX_TRANSMISSION_SIZE, _deviceId);
    // if (mtu <= 0) mtu = 20;
    // int length = (offset + mtu > size) ? size - offset : mtu;

    try {
      final readCommand = OacpOpCodeUtils.getReadRequest(offset, size);
      final oacpResponse = await _sendOacpCommand(readCommand);
      if (oacpResponse == null ||
          oacpResponse.resultCode != OACPConstants.SUCCESS) {
        throw Exception('OacpResponseException()');
      }

      final chunk = await _ble.l2CapRead(socketId, _deviceId);
      _logMessage('✅ Received chunk:$chunk | (${chunk.length} bytes)');

      return chunk;
    } catch (e) {
      _logMessage('🔥 Exception during read: $e');
      return [];
    }
  }

  Future<OlcpResponse?> _sendOlcpCommand(List<int> olcpCommand) async {
    try {
      final now = DateTime.now();

      // Write the command to OLCP characteristic using UUID from your metadata
      final writeResponse = await _controller.writeCharacteristic(
        _metaDataUuids
            .olcpUuid, // Make sure you have this UUID in your _metaDataUuids
        olcpCommand,
      );

      if (writeResponse) {
        return _controller.getOlcpChanged(now);
      }
    } catch (e) {
      _logMessage('Error sending OLCP command: $e');
    }

    return null;
  }

  Future<OacpResponse?> _sendOacpCommand(List<int> oacpCommand) async {
    try {
      final now = DateTime.now();
      final writeResponse = await _controller.writeCharacteristic(
          _metaDataUuids.oacpUuid, oacpCommand);
      if (writeResponse) {
        return _controller.getOacpChanged(now);
      }
    } catch (e) {
      _logMessage('_sendOlcpCommand: $e');
    }

    return null;
  }

  bool _isWriteAllowed(
      OACPFeatures oacpFeatures, ObjectMetaData objectMetaData) {
    if (!oacpFeatures.writeOpCodeSupported ||
        !objectMetaData.objectProperties.write) {
      return false;
    }
    return true;
  }

  bool _isReadAllowed(
      OACPFeatures oacpFeatures, ObjectMetaData objectMetaData) {
    if (!oacpFeatures.readOpCodeSupported ||
        !objectMetaData.objectProperties.read) {
      return false;
    }
    return true;
  }

  Future<List<int>?> readDataFromId(
      OACPFeatures oacpFeatures, List<int> id) async {
    try {
      final metaData = await _gotoObjectAndReadMetaData(id);
      if (metaData != null) {
        return await _readCurrentObject(oacpFeatures, metaData);
      }
    } catch (e) {
      _logMessage('readDataFromId: $e');
    }
    return null;
  }

  bool _isExecuteAllowed(OACPFeatures oacpFeatures, ObjectMetaData metaData) {
    if (!oacpFeatures.executeOpCodeSupported) {
      _logMessage('OperationNotSupportedException("execute")');
      return false;
    }

    if (!metaData.objectProperties.execute) {
      _logMessage('OperationNotSupportedException("execute")');
      return false;
    }

    return true;
  }

  Future<bool> executeId(List<int> id, OACPFeatures oacpFeatures) async {
    try {
      final metaData = await _gotoObjectAndReadMetaData(id);
      if (metaData == null) {
        _logMessage('couldnt get meta data for id $id');
        return false;
      }
      if (!_isExecuteAllowed(oacpFeatures, metaData)) {
        return false;
      }

      final oacpCommand = OacpOpCodeUtils.getExecuteRequest();

      final oacpResponse = await _sendOacpCommand(oacpCommand);

      if (oacpResponse != null) {
        return oacpResponse.resultCode == OACPConstants.SUCCESS;
      }
    } catch (e) {
      _logMessage('executeId: $e');
    }

    return false;
  }

  Future<bool> writeDataToId(
      OACPFeatures oacpFeatures, List<int> id, List<int> value) async {
    try {
      final metaData = await _gotoObjectAndReadMetaData(id);
      if (metaData != null) {
        return await _writeCurrentObject(oacpFeatures, metaData, value);
      }
    } catch (e) {
      _logMessage('writeDataToId: $e');
    }
    return false;
  }

  Future<bool> createObject(
      OACPFeatures oacpFeatures, List<int> id, List<int> value) async {
    try {
      final created = await _createObjectWithId(id, value.length);
      if (!created) return false;
      _logMessage('write num of objects');
      return true; // return true here on success
    } catch (e) {
      _logMessage('createObject: $e');
      return false; // return false on exception
    }
  }

  Future<List<ObjectMetaData>> getListOfSupportedUuids() async {
    final List<ObjectMetaData> metaData = [];
    var command = [OLCPConstants.FIRST];
    var now = DateTime.now();
    await _controller.writeCharacteristic(_metaDataUuids.olcpUuid, command);

    while ((await _controller.getOlcpChanged(now)).resultCode ==
        OLCPConstants.SUCCESS) {
      metaData.add(await _getMetaDataOfCurrentObject());
      command = [OLCPConstants.NEXT];
      now = DateTime.now();
      await _controller.writeCharacteristic(_metaDataUuids.olcpUuid, command);
    }

    return metaData;
  }

  Future<void> cancelSubscriptions() => _controller.cancelSubscriptions();
}
