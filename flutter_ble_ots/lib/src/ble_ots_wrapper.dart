import 'dart:typed_data';

import 'package:flutter_ble_ots/src/models/ots_features.dart';
import 'package:flutter_ble_ots/src/object_transfer_protocol.dart';

import '../flutter_ble_ots.dart';

class BleOtsWrapper {
  final String _deviceId;
  final BleDeviceInteractor _ble;
  final void Function(String message) _logMessage;
  final MetaDataUuids _metaDataUuids;
  late ObjectTransferProtocol _otp;
  late OtsFeatures _features;
  final String Function(Uint8List uuid)? _getNameFromUuid;
  BleOtsWrapper(this._deviceId, this._ble, this._logMessage,
      this._metaDataUuids, this._getNameFromUuid) {
    _otp = ObjectTransferProtocol(
      _ble,
      _deviceId,
      _logMessage,
      _metaDataUuids,
      _getNameFromUuid,
    );
  }

  Future<void> init({CommonConnectionPriority? priority}) async {
    final feat = await _otp.discoverFeatures();

    if (feat == null) {
      throw Exception('discover features failed');
    } else {
      _features = feat;
    }
  }

  void observeServiceId(Uint8List serviceUuid) {
    _otp.observeServiceId(serviceUuid);
  }

  Future<List<int>> waitForCustomUuidChanged(
          Uint8List serviceUuid, DateTime afterTime) async =>
      _otp.waitForCustomUuidChanged(
        serviceUuid,
        afterTime,
      );

  Future<List<int>?> readDataFromId(List<int> id) async {
    try {
      return _otp.readDataFromId(_features.oacpFeatures, id);
    } catch (e) {
      _logMessage('l2capRead: $e');
      return null;
    }
  }

  Future<bool> selectObjectId(List<int> id) => _otp.selectObjectId(id);

  Future<bool> writeDataToId(List<int> id, List<int> value) async {
    try {
      return _otp.writeDataToId(_features.oacpFeatures, id, value);
    } catch (e) {
      _logMessage('l2capWrite: $e');
      return false;
    }
  }

  Future<bool> createObject(List<int> id, List<int> value) {
    return _otp.createObject(_features.oacpFeatures, id, value);
  }

  Future<bool> executeId(List<int> id) =>
      _otp.executeId(id, _features.oacpFeatures);

  Future<List<ObjectMetaData>> getListOfSupportedUuids() =>
      _otp.getListOfSupportedUuids();

  Future<void> cancelSubscriptions() => _otp.cancelSubscriptions();
}
