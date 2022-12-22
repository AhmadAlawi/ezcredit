// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ezcredit/api/generalApis/auth_api.dart';
import 'package:ezcredit/controller/device_controler.dart';
import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../globals.dart';
import '../screen/login_screen.dart';
import '../screen/main_screen_two.dart';
import '../screen/otp_screen.dart';
import '../widgets/generalWidgets/bottom_nav_list.dart';
import '../widgets/generalWidgets/common_ui.dart';
import 'apply_controller.dart';
import 'home_data_controller.dart';
import 'notification_controller.dart';

class Authcontroller extends ChangeNotifier {
  Map<String, dynamic> singUpMap = {};
  Map<String, dynamic> loginMap = {};
  Map<String, dynamic> otpMap = {};

  String? errorMessage;

  bool isLoading = false;
  set setIsloading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<Map<String, dynamic>?> signupHandler({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String? fcmtoken = await FirebaseMessaging.instance.getToken();

    final deviceData =
        await Provider.of<DeviceinfoController>(context, listen: false)
            .getDeviceInfoHandler();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setIsloading = true;

      singUpMap = await AuthAPI().signUpEndPoints(
          email, password, fcmtoken, deviceData[0], deviceData[1]);

      setIsloading = false;

      if (singUpMap['result'] == true) {
        await prefs.setInt('userId', singUpMap['data']);
        await prefs.setString('email', email);

        userId = prefs.getInt('userId');

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpScreen(
                      email: email,
                      password: password,
                    )));
      } else {
        var error = singUpMap['error'];
        bool containsEmail = error.containsKey('email');
        bool containsPassword = error.containsKey('password');

        if (containsEmail == true) {
          var emailfield = error['email'];
          bool containsEmailField = emailfield.containsKey('email_field');

          if (containsEmailField == true) {
            errorMessage = '${error['email']['email_field']['msg_en']}';
          } else {
            errorMessage = '${error['email']['msg_en']}';
          }
        } else if (containsPassword == true) {
          errorMessage = '${error['password']['password_field']['msg_en']}';
        }
        CommonUi.simpleToast(message: '$errorMessage');
      }
      return singUpMap;
    } catch (e) {
      setIsloading = false;

      return CommonUi.simpleToast(message: '$errorMessage');
    }
  }

  Future<Map<String, dynamic>?> loginHandler({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    String? fcmtoken = await FirebaseMessaging.instance.getToken();

    final deviceData =
        await Provider.of<DeviceinfoController>(context, listen: false)
            .getDeviceInfoHandler();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setIsloading = true;

      loginMap = await AuthAPI().loginEndpoints(
          email, password, fcmtoken, deviceData[0], deviceData[1]);
      setIsloading = false;
      if (loginMap['result'] == true) {
        await prefs.setString('token', loginMap['data'][0]);
        await prefs.setInt('userId', loginMap['data'][1]);
        await prefs.setString('email', email);

        authToken = '${prefs.getString('token')}';
        userId = userId == 0 ? prefs.getInt('userId') : userId;
        termsSignup == false;

        user = 'user';
        MainScreenController().pageIndex = 2;
        MainScreenController().changeBodyHandler(2);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainScreenTwo()),
            (route) => false);

        notifyListeners();
      } else {
        var error = loginMap['error'];

        if (loginMap['loginStatus'] == 75) {
          Navigator.pushNamed(context, OtpScreen.id);
        }
        bool containsPassword = error.containsKey('password');
        bool containsEmail = error.containsKey('email');
        bool containsMsg = error.containsKey('fields');

        if (containsPassword == true) {
          errorMessage = '${error['password']['msg_en']}';
        } else if (containsEmail == true) {
          var emailfield = error['email'];
          bool containsEmailField = emailfield.containsKey('email_field');

          if (containsEmailField == true) {
            errorMessage = '${error['email']['email_field']['msg_en']}';
          } else {
            errorMessage = '${error['email']['msg_en']}';
          }
        } else if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
        }
        CommonUi.simpleToast(message: '$errorMessage');
      }
    } catch (e) {
      CommonUi.simpleToast(message: '$errorMessage');
    }
  }

  Future<Map<String, dynamic>?> checkOtpHandler(
      {required int userotp,
      required BuildContext context,
      String? email,
      String? password}) async {
    try {
      setIsloading = true;

      otpMap = await AuthAPI().checkOtpEndpoints(userotp, userId);

      setIsloading = false;

      if (otpMap['result'] == false) {
        var error = otpMap['error'];
        bool containsOtp = error.containsKey('userotp');
        bool containsField = error.containsKey('fields');

        if (containsOtp == true) {
          errorMessage = '${error['userotp']['msg_en']}';
        } else if (containsField == true) {
          errorMessage = '${error['fields']['msg_en']}';
        }
        CommonUi.simpleToast(message: '$errorMessage');
      } else {
        await loginHandler(
            context: context, email: '$email', password: '$password');
      }
    } catch (e) {
      setIsloading = false;

      debugPrint(
        'error in Authcontroller otp ${e.toString()}',
      );
      errorMessage = otpMap['error'];
    }
  }

  logOut(BuildContext context, String? msg) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (msg != null) {
      CommonUi.simpleToast(message: msg);
    }
    for (String key in prefs.getKeys()) {
      if (key != "firsttime") {
        ApplyController().applyLoanMap = {};
        HomeDataController().removeData();
        print(
            'HomeDataController().offersModel === ${HomeDataController().offersModel}');
        NotificationController().removeNotification();
        notifyListeners();

        authToken = '';
        userId = 0;
        user = '';
        prefs.remove(key).then(
            (value) => Navigator.pushReplacementNamed(context, LoginScreen.id));
        authToken = '';
        user = '';
      }
    }
  }
}
