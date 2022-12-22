import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceinfoController extends ChangeNotifier {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<List<String>> getDeviceInfoHandler() async {
    List<String> deviceData = [];
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        deviceData = [
          '${Platform.operatingSystem} ${androidInfo.model}',
          '${androidInfo.version.release}',
        ];
        return deviceData;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        deviceData = [
          '${iosInfo.name}',
          '${iosInfo.systemVersion}',
        ];

        return deviceData;
      }

      notifyListeners();
    } on PlatformException catch (error) {
      debugPrint(error.toString());
    } catch (e) {
      debugPrint(
        'error in AuthViewModel register ${e.toString()}',
      );
    }
    return deviceData;
  }
}
