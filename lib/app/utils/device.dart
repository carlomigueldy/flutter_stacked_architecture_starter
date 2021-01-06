import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppDeviceInfo {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<String> getDeviceName() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    }

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.model;
    }

    return "Unknown Device";
  }
}
