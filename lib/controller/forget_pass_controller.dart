// ignore_for_file: use_build_context_synchronously

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ezcredit/api/generalApis/password_api.dart';
import 'package:ezcredit/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/generalWidgets/common_ui.dart';

class ForgetPassController extends ChangeNotifier {
  Map<String, dynamic> forgetPassMap = {};
  Map<String, dynamic> changePassMap = {};

  String? errorMessage;

  bool isLoading = false;
  set setIsloading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<Map<String, dynamic>?> forgetpassHandler({
    required String email,
    required BuildContext context,
  }) async {
    try {
      setIsloading = true;

      forgetPassMap = await PasswordAPI().forgetPasswordEndPoints(email);

      setIsloading = false;

      if (forgetPassMap['result'] == true) {
        return forgetPassMap = {'result': true, 'data': forgetPassMap['data']};
      } else {
        var error = forgetPassMap['error'];
        bool containsEmail = error.containsKey('email');
        bool containsdb = error.containsKey('db');

        if (containsEmail == true) {
          var emailfield = error['email'];
          bool containsEmailField = emailfield.containsKey('email_field');

          if (containsEmailField == true) {
            errorMessage = '${error['email']['email_field']['msg_en']}';
          } else {
            errorMessage = '${error['email']['msg_en']}';
          }
        } else if (containsdb == true) {
          errorMessage = '${error['db']['msg_en']}';
        }
        CommonUi.simpleToast(message: '$errorMessage');
      }
      return forgetPassMap;
    } catch (e) {
      setIsloading = false;
    }
  }

  // ************************************* CHANGE PASS CONTROLLER *************************************

  Future<Map<String, dynamic>?> changepassHandler({
    required String newPass,
    required String currentPass,
    required BuildContext context,
  }) async {
    try {
      setIsloading = true;

      changePassMap = await PasswordAPI().changePasswordEndPoints(
          currentPassword: currentPass, newPassword: newPass);

      setIsloading = false;

      if (changePassMap['result'] == true) {
        Navigator.pop(context);

        CommonUi.simpleToast(message: 'Password Changed');
      } else {
        var error = changePassMap['error'];

        bool containsPassword = error.containsKey('password');

        if (containsPassword == true) {
          errorMessage = '${error['password']['msg_en']}';
        }

        CommonUi.simpleToast(message: '$errorMessage');
      }
      return changePassMap;
    } catch (e) {
      setIsloading = false;
    }
  }
}
