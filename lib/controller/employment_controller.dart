// ignore_for_file: use_build_context_synchronously

import 'package:ezcredit/api/generalApis/employee_api.dart';
import 'package:ezcredit/model/employment_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globals.dart';
import '../widgets/generalWidgets/common_ui.dart';

class EmploymentController extends ChangeNotifier {
  dynamic result;

  EmploymentModel? employmentModel;

  Map<String, dynamic>? employeeMap = {};

  bool isLoading = false;
  set setIsloading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  bool postLoading = false;

  set setPostloading(bool value) {
    postLoading = value;
    notifyListeners();
  }

  String errorMessage = '';

  Future checkEmploymentData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('employer') == null ||
        prefs.getString('employer') == 'null') {
      employmentModel = await getEmploymentInfoHandler(context);
    }
    notifyListeners();
  }

  Future<EmploymentModel?> getEmploymentInfoHandler(
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setIsloading = true;
      employmentModel = await EmployeeAPI().getEmployeeInfoEndPoints(context);
      if (employmentModel != null) {
        await prefs.setString('employer', '${employmentModel?.employer}');
        await prefs.setString('income', '${employmentModel?.income}');
        await prefs.setString(
            'employmentStatus', '${employmentModel?.employmentStatus}');
        notifyListeners();
      } else {
        var error = EmployeeAPI().errorMessage;
        bool containsMsg = error.containsKey('fields');

        if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
          CommonUi.snackBar(context, errorMessage);
        }
      }
      setIsloading = false;
      notifyListeners();

      return employmentModel;
    } catch (e) {
      setIsloading = false;
      errorMessage = EmployeeAPI().errorMessage;
      CommonUi.snackBar(context, errorMessage);

      debugPrint('error in employment controller = $errorMessage');
    }
  }

  Future<Map<String, dynamic>?> addEmploymentInfoHandler({
    required String employer,
    required String status,
    required int income,
    required int salary,
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setPostloading = true;
      employeeMap = await EmployeeAPI()
          .updateEmployeeInfoEndpoints(employer, status, income, context);

      setPostloading = false;

      if (employeeMap!['result'] == true) {
        prefs.setString('employer', employer);
        prefs.setString('income', '$income');
        prefs.setString('employmentStatus', status);
        if (profile == false) {
          CommonUi.simpleToast(message: 'Added Successfully');
        }
      } else {
        var error = employeeMap?['error'];
        bool containsServer = error.containsKey('server');
        bool containsMsg = error.containsKey('fields');
        if (containsServer == true) {
          errorMessage = '${error['server']['msg_en']}';
        } else if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
        }
        CommonUi.snackBar(context, errorMessage);
      }
      return employeeMap;
    } catch (e) {
      setPostloading = false;
    }
  }
}
