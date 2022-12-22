import 'dart:convert';
import 'dart:io';
import 'package:ezcredit/globals.dart';
import 'package:http/http.dart' as http;
import '../end_points.dart';

class AuthAPI {
  static final AuthAPI _appManager = AuthAPI._internal();

  factory AuthAPI() {
    return _appManager;
  }

  AuthAPI._internal();

  dynamic errorMessage;
  // ************************************* SIGNUP API *************************************

  Future<Map<String, dynamic>> signUpEndPoints(
      email, password, fcmToken, deviceModel, deviceOSVersion) async {
    var url = Uri.parse('${EndPoints.server}${EndPoints.signup}');

    Map<String, dynamic> singUpMap = {};

    var body = jsonEncode({
      "email": email,
      "password": password,
      "fcm": fcmToken,
      "dm": deviceModel,
      "dos": deviceOSVersion,
      "usertype": "customer",
    });

    try {
      http.Response res = await http.post(url, headers: header, body: body);

      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        singUpMap = {
          'result': true,
          "error": '',
          "data": json['data']['userid'],
        };
        return singUpMap;
      } else {
        errorMessage = json['errors'];

        singUpMap = {
          'result': false,
          "error": errorMessage,
          "data": '',
        };
      }
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      singUpMap = {
        'result': false,
        "error": errorMessage,
        "data": '',
      };
    } catch (e) {
      errorMessage = "error in signUp = $e";
      singUpMap = {
        'result': false,
        "error": errorMessage,
        "data": '',
      };
    }
    return singUpMap;
  }

  // ************************************* LOGIN API *************************************

  Future<Map<String, dynamic>> loginEndpoints(
      email, password, fcmToken, deviceModel, deviceOSVersion) async {
    Map<String, dynamic> loginMap = {};
    try {
      var url = Uri.parse('${EndPoints.server}${EndPoints.login}');

      var body = jsonEncode({
        "email": email,
        "password": password,
        "fcm": fcmToken,
        "dm": deviceModel,
        "dos": deviceOSVersion,
        "type": "customer",
      });

      http.Response res = await http.post(url, headers: header, body: body);
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        loginMap = {
          'result': true,
          "error": '',
          "data": [
            json['data']['authToken'],
            json['data']['userid'],
            json['login_state']
          ]
        };
        return loginMap;
      } else {
        errorMessage = json['errors'];

        loginMap = {
          'result': false,
          "error": errorMessage,
          "data": [],
          'loginStatus': json['login_state']
        };
      }
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      loginMap = {
        'result': false,
        "error": errorMessage,
        "data": [],
      };
    } catch (e) {
      errorMessage = "error in login = $e";
      loginMap = {
        'result': false,
        "error": errorMessage,
        "data": [],
      };
    }

    return loginMap;
  }

  Future<Map<String, dynamic>> checkOtpEndpoints(
      int userotp, int? userid) async {
    Map<String, dynamic> otpMap = {};

    var url = Uri.parse('${EndPoints.server}${EndPoints.checkOtp}');

    var body = jsonEncode({"userotp": userotp, "userid": userid});
    try {
      http.Response res = await http.post(url, body: body, headers: header);
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        otpMap = {"result": json['success'], "error": ""};
        return otpMap;
      } else {
        errorMessage = json['errors'];
        otpMap = {"result": json['success'], "error": errorMessage};
      }
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      otpMap = {"result": false, "error": errorMessage};
    } catch (e) {
      errorMessage = "error in Otp = $e";
      otpMap = {"result": false, "error": errorMessage};
    }
    return otpMap;
  }
}
