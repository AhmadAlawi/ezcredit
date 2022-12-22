import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ezcredit/globals.dart';
import 'package:http/http.dart' as http;
import '../end_points.dart';

class PasswordAPI {
  static final PasswordAPI _appManager = PasswordAPI._internal();

  factory PasswordAPI() {
    return _appManager;
  }

  PasswordAPI._internal();

  dynamic errorMessage;

  // ************************************* FORGET PASS API *************************************

  Future<Map<String, dynamic>> forgetPasswordEndPoints(email) async {
    var url = Uri.parse('${EndPoints.server}${EndPoints.forgetpass}');

    Map<String, dynamic> forgetPassMap = {};

    var body = jsonEncode({
      "email": email,
    });

    try {
      http.Response res = await http.post(url, headers: header, body: body);

      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        forgetPassMap = {
          'result': json['success'],
          "error": '',
          "data": json['data'],
        };
        return forgetPassMap;
      } else {
        errorMessage = json['errors'];

        forgetPassMap = {
          'result': json['success'],
          "error": errorMessage,
          "data": '',
        };
      }
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      forgetPassMap = {
        'result': false,
        "error": errorMessage,
        "data": '',
      };
    } catch (e) {
      errorMessage = "error in signUp = $e";
      forgetPassMap = {
        'result': false,
        "error": errorMessage,
        "data": '',
      };
    }
    return forgetPassMap;
  }

  // ************************************* CHANGE PASS API *************************************

  Future<Map<String, dynamic>> changePasswordEndPoints(
      {required String currentPassword, required String newPassword}) async {
    var url = Uri.parse('${EndPoints.server}${EndPoints.changepass}');

    Map<String, dynamic> changePassMap = {};

    var body = jsonEncode({
      "current_ps": currentPassword,
      "new_ps": newPassword,
      "userid": userId
    });

    try {
      http.Response res = await http.post(url,
          headers: {'auth': authToken, "Content-Type": "application/json"},
          body: body);

      var json = jsonDecode(res.body);
      print('json === $json');

      if (res.statusCode == 200) {
        changePassMap = {
          'result': json['success'],
          "error": '',
        };
        return changePassMap;
      } else {
        errorMessage = json['errors'];

        changePassMap = {
          'result': json['success'],
          "error": errorMessage,
        };
      }
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      changePassMap = {
        'result': false,
        "error": errorMessage,
      };
    } catch (e) {
      errorMessage = "error in signUp = $e";
      changePassMap = {
        'result': false,
        "error": errorMessage,
      };
    }
    return changePassMap;
  }
}
