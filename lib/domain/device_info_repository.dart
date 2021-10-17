import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

// usage ::
// https://stackoverflow.com/questions/45300661/how-to-check-the-device-os-version-from-flutter
// https://qiita.com/ko2ic/items/2a0aa4301011f8f52275#device_info-0402
// https://developer.android.com/studio/releases/platforms?hl=ja
class DeviceInfoRepository {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<AndroidDeviceInfo?> getAndroidDeviceInfo() async {
    if (!Platform.isAndroid) {
      return null;
    }
    final AndroidDeviceInfo _androidInfo = await _deviceInfo.androidInfo;
    return _androidInfo;
  }

  Future<int?> getAndroidDeviceSdkInt() async {
    final AndroidDeviceInfo? androidInfo = await getAndroidDeviceInfo();
    return androidInfo!.version.sdkInt;
  }

  Future<String?> getAndroidDeviceReleaseVerison() async {
    final AndroidDeviceInfo? androidInfo = await getAndroidDeviceInfo();
    return androidInfo!.version.release;
  }
}
