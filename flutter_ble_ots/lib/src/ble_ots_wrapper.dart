import 'dart:typed_data';

import 'package:flutter_ble_ots/src/models/ots_features.dart';
import 'package:flutter_ble_ots/src/object_transfer_protocol.dart';
import 'package:l2cap_ble/l2cap_ble.dart';

import '../flutter_ble_ots.dart';

class BleOtsWrapper {
  final String _deviceId;
  final BleDeviceInteractor _ble;
  final void Function(String message) _logMessage;
  final MetaDataUuids _metaDataUuids;
  late ObjectTransferProtocol _otp;
  late OtsFeatures _features;
  late L2capBle _l2capBle;
  final String Function(Uint8List uuid)? _getNameFromUuid;
  BleOtsWrapper(this._deviceId, this._ble, this._logMessage,
      this._metaDataUuids, this._getNameFromUuid) {
    final _l2capBle = L2capBle();
    this._l2capBle = _l2capBle;
    _otp = ObjectTransferProtocol(
      _ble,
      _deviceId,
      _logMessage,
      _metaDataUuids,
      _getNameFromUuid,
      _l2capBle,
    );
  }

  Future<void> init({CommonConnectionPriority? priority}) async {
    final connected = await _l2capBle.connectToDevice(_deviceId);

    if (!connected) {
      throw Exception('connection failed');
    }

    // final created = await _l2capBle.createL2capChannel(0x25);

    // if (!created) {
    //   throw Exception('l2cap channel failed');
    // }

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

  Future<List<int>?> readDataFromId(List<int> id) {
    return _otp.readDataFromId(_features.oacpFeatures, id);
  }

  Future<bool> selectObjectId(List<int> id) => _otp.selectObjectId(id);

  Future<bool> writeDataToId(List<int> id, List<int> value) {
    return _otp.writeDataToId(_features.oacpFeatures, id, value);
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
