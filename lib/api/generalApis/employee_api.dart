// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:ezcredit/model/employment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../controller/auth_controller.dart';
import '../../globals.dart';
import '../end_points.dart';

class EmployeeAPI {
  static final EmployeeAPI _appManager = EmployeeAPI._internal();

  factory EmployeeAPI() {
    return _appManager;
  }

  dynamic errorMessage;

  EmployeeAPI._internal();

  // ************************************* GET EMPLOYEE INFO API *************************************

  Future<EmploymentModel?> getEmployeeInfoEndPoints(
      BuildContext context) async {
    EmploymentModel employmentModel;

    try {
      var url = Uri.parse(
        '${EndPoints.server}${EndPoints.getEmployeeInfo}?userid=$userId',
      );

      http.Response res = await http.get(
        url,
        headers: {'auth': authToken, "Content-Type": "application/json"},
      );
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        employmentModel = EmploymentModel.fromJson(json['data']);
        debugPrint('profileInfoModel === $employmentModel');
        return employmentModel;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors'];
        }
      }
    } catch (e) {
      errorMessage = 'Error in get employment info :  $e';
    }
    // return employmentModel;
  }

  // ************************************* UPDATE EMPLOYEE INFO API *************************************

  Future<Map<String, dynamic>?> updateEmployeeInfoEndpoints(
      employer, status, income, BuildContext context) async {
    Map<String, dynamic> employeeMap = {};

    try {
      var url = Uri.parse('${EndPoints.server}${EndPoints.updateEmployeeInfo}');

      var body = jsonEncode({
        "userid": userId,
        "employer": employer,
        "status": status,
        "currency": "KWD",
        "income": "215",
        "salary": "555"
      });

      http.Response res = await http.post(url,
          headers: {'auth': authToken, "Content-Type": "application/json"},
          body: body);

      var json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        employeeMap = {"result": json['success'], "error": ''};
        return employeeMap;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors'];
          employeeMap = {"result": json['success'], "error": errorMessage};
        }
      }
    } catch (e) {
      employeeMap = {
        "result": false,
        "error": "error in add employee Info : $e"
      };
    }
  }
}
