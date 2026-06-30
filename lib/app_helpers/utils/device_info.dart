import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:logger/logger.dart';

Future<void> getDeviceId() async {
  final deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String deviceId = androidInfo.id;
    Logger().i(deviceId);
  }
}
