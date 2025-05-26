import 'models/common_ble_models/common_ble_models.dart';

abstract class BleDeviceInteractor {
  Future<List<int>> readCharacteristic(CommonCharacteristic characteristic);
  Future<void> writeCharacteristicWithResponse(
      CommonCharacteristic characteristic, List<int> value);
  Future<void> writeCharacteristicWithoutResponse(
      CommonCharacteristic characteristic, List<int> value);
  Future<void> requestConnectionPriority(
      CommonConnectionPriority priority, String deviceId);
  Future<int> requestMtu(int mtu, String deviceId);
  Future<String?> createL2CapChannel(int psm, String deviceId);
  Future<bool> closeL2CapChannel(String socketId, String deviceId);
  Future<List<int>> l2CapRead(String socketId, String deviceId);
  Future<bool> l2CapWrite(String socketId, String deviceId, List<int> value);
  Stream<List<int>> subscribeToCharacteristic(
      CommonCharacteristic characteristic);
}
