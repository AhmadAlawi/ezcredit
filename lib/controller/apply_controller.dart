// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:ezcredit/api/generalApis/apply_loan_api.dart';
import 'package:ezcredit/controller/address_controller.dart';
import 'package:ezcredit/controller/employment_controller.dart';
import 'package:ezcredit/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../globals.dart';
import '../lang/change_lang.dart';
import '../lang/config.dart';
import '../widgets/generalWidgets/common_ui.dart';

class ApplyController extends ChangeNotifier {
  Map<String, dynamic> applyLoanMap = {};

  Map<String, dynamic> applyMapApi = {};

  Map<String, dynamic> loanValidateMap = {};

  dynamic errorMessage;

  bool isLoading = false;
  set setIsloading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future getProfileData(BuildContext context) async {
    setIsloading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('fullname_ar') == null ||
        prefs.getString('fullname_ar') == "null" ||
        prefs.getString('employer') == null ||
        prefs.getString('employer') == "null") {
      await ProfileController().getProfileInfoHandler(context).then(
          (value) => EmploymentController().getEmploymentInfoHandler(context));

      notifyListeners();
    } else {
      initializeData(context);
    }

    setIsloading = false;
  }

  Future initializeData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    applyLoanMap['fullname_ar'] = prefs.getString('fullname_ar') == null ||
            prefs.getString('fullname_ar') == "null"
        ? ''
        : '${prefs.getString('fullname_ar')}';
    applyLoanMap['fullname_en'] = prefs.getString('fullname_en') == null ||
            prefs.getString('fullname_en') == "null"
        ? ''
        : '${prefs.getString('fullname_en')}';
    applyLoanMap['gender'] =
        prefs.getString('gender') == null || prefs.getString('gender') == "null"
            ? ''
            : '${prefs.getString('gender')}';
    applyLoanMap['country'] = local == ConfigLanguage.arLocale
        ? prefs.getString('country_ar') == null ||
                prefs.getString('country_ar') == 'null'
            ? ''
            : '${prefs.getString('country_ar')}'
        : prefs.getString('country_en') == null ||
                prefs.getString('country_en') == 'null'
            ? ''
            : '${prefs.getString('country_en')}';

    applyLoanMap['city'] = local == ConfigLanguage.arLocale
        ? prefs.getString('cityAr') == null ||
                prefs.getString('cityAr') == 'null'
            ? ''
            : '${prefs.getString('cityAr')}'
        : prefs.getString('cityEn') == null ||
                prefs.getString('cityEn') == 'null'
            ? ''
            : '${prefs.getString('cityEn')}';

    applyLoanMap['birthDate'] = prefs.getString('birth_date') == null ||
            prefs.getString('birth_date') == 'null'
        ? ''
        : '${prefs.getString('birth_date')}';
    applyLoanMap['civilId'] = prefs.getString('civilId') == null ||
            prefs.getString('civilId') == 'null'
        ? ''
        : '${prefs.getString('civilId')}';

    applyLoanMap['phoneNumber'] =
        prefs.getString('phone') == null || prefs.getString('phone') == 'null'
            ? ''
            : '${prefs.getString('phone')}';

    applyLoanMap['status'] = prefs.getString('employmentStatus') == null ||
            prefs.getString('employmentStatus') == "null"
        ? ''
        : '${prefs.getString('employmentStatus')}';

    applyLoanMap['employer'] = prefs.getString('employer') == null ||
            prefs.getString('employer') == "null"
        ? ''
        : '${prefs.getString('employer')}';

    applyLoanMap['income'] =
        prefs.getString('income') == null || prefs.getString('income') == "null"
            ? ''
            : '${prefs.getString('income')}';
    applyLoanMap['salary'] =
        prefs.getString('salary') == null || prefs.getString('salary') == "null"
            ? ''
            : '${prefs.getString('income')}';

    applyLoanMap['currency'] = prefs.getString('currency') == null ||
            prefs.getString('currency') == "null"
        ? ''
        : '${prefs.getString('currency')}';

    applyLoanMap['amount'] =
        prefs.getString('amount') == null || prefs.getString('amount') == "null"
            ? ''
            : '${prefs.getString('amount')}';

    applyLoanMap['installments'] = prefs.getString('installments') == null ||
            prefs.getString('installments') == "null"
        ? ''
        : '${prefs.getString('installments')}';

    applyLoanMap['loanType'] = prefs.getString('loanType') == null ||
            prefs.getString('loanType') == "null"
        ? ''
        : '${prefs.getString('loanType')}';

    applyLoanMap['bankType'] = prefs.getString('bankType') == null ||
            prefs.getString('bankType') == "null"
        ? ''
        : '${prefs.getString('bankType')}';
  }

  Future saveDataHandlerData({required Map<String, dynamic> applyMap}) async {
    applyLoanMap.addAll(applyMap);
    notifyListeners();
  }

  Future<Map<String, dynamic>?> applyLoanHandler(
      BuildContext context, Function dialog) async {
    try {
      setIsloading = true;
      applyMapApi = await ApplyLoanAPI().applyLoanEndPoints(
          preferredBusinessType: applyLoanMap['bankType'],
          type: applyLoanMap['loanType'],
          amount: int.parse(applyLoanMap['amount']),
          installmentNum: int.parse(applyLoanMap['installments']),
          fullNameAr: applyLoanMap['fullname_ar'],
          fullNameEn: applyLoanMap['fullname_en'],
          civilId: applyLoanMap['civilId'],
          nationality: nationalityID,
          country: nationalityID,
          city: cityId,
          phoneNumber: '+965${applyLoanMap['phoneNumber']}',
          gender: applyLoanMap['gender'],
          birthDate: applyLoanMap['birthDate'],
          employmentStatus: applyLoanMap['status'],
          employer: applyLoanMap['employer'],
          income: int.parse(applyLoanMap['income']),
          salary: int.parse(applyLoanMap['salary']),
          context: context);

      setIsloading = false;
      if (applyMapApi['result'] == false) {
        var error = applyMapApi['error'];
        bool containsServer = error.containsKey('server');
        bool containsMsg = error.containsKey('fields');
        bool containsdb = error.containsKey('db');

        if (containsServer == true) {
          errorMessage = '${error['server']['msg_en']}';
        } else if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
        } else if (containsdb == true) {
          errorMessage = '${error['db']['msg_en']}';
        }
        CommonUi.snackBar(context, errorMessage);
        debugPrint('error in apply loan : $errorMessage');
      } else {
        dialog(context);
      }
    } catch (e) {
      debugPrint('error in apply loan : $e');
    }
  }

  Future<Map<String, dynamic>?> loanValidateStep1Handler(
      {required int status, required BuildContext context}) async {
    try {
      setIsloading = true;
      loanValidateMap = await ApplyLoanAPI().loanValidateStep1EndPoints(
          fullNameAr: applyLoanMap['fullname_ar'],
          fullNameEn: applyLoanMap['fullname_en'],
          civilId: applyLoanMap['civilId'],
          nationality: nationalityID,
          country: nationalityID,
          city: cityId,
          phoneNumber: '+965${applyLoanMap['phoneNumber']}',
          gender: applyLoanMap['gender'],
          birthDate: applyLoanMap['birthDate'],
          status: status,
          context: context);

      setIsloading = false;
      if (loanValidateMap['result'] == true) {
        return loanValidateMap = {
          'result': true,
          'message': loanValidateMap['message'],
          'error': ''
        };
      } else {
        var error = loanValidateMap['error'];
        bool containsMsg = error.containsKey('fields');
        bool containsServer = error.containsKey('server');

        if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
        } else if (containsServer == true) {
          errorMessage = '${error['server']['msg_en']}';
        }
        CommonUi.simpleToast(message: errorMessage);
        debugPrint('error in loan validate step 1 : $errorMessage');
        loanValidateMap = {
          'result': false,
          "error": errorMessage,
        };
      }
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      loanValidateMap = {
        'result': false,
        "error": errorMessage,
      };
    } catch (e) {
      debugPrint('error in loan validate step 1  : $e');
    }
  }

  Future<Map<String, dynamic>?> loanValidateStepTwoHandler(
      {required int status, required BuildContext context}) async {
    try {
      setIsloading = true;
      loanValidateMap = await ApplyLoanAPI().loanValidateStep2EndPoints(
          employmentStatus: applyLoanMap['status'],
          employer: applyLoanMap['employer'],
          income: int.parse(applyLoanMap['income']),
          salary: int.parse(applyLoanMap['salary']),
          status: status,
          context: context);
      setIsloading = false;
      if (loanValidateMap['result'] == true) {
        return loanValidateMap = {
          'result': true,
          'message': loanValidateMap['message'],
          'error': ''
        };
      } else {
        var error = loanValidateMap['error'];
        bool containsServer = error.containsKey('server');
        bool containsMsg = error.containsKey('fields');
        bool containsdb = error.containsKey('db');

        if (containsServer == true) {
          errorMessage = '${error['server']['msg_en']}';
        } else if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
        } else if (containsdb == true) {
          errorMessage = '${error['db']['msg_en']}';
        }
        CommonUi.simpleToast(message: errorMessage);

        debugPrint('error in loan validate step 2 : $errorMessage');
      }
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      loanValidateMap = {
        'result': false,
        "error": errorMessage,
      };
    } catch (e) {
      debugPrint('error in loan validate step 2  : $e');
    }
  }

  Future<Map<String, dynamic>?> loanValidateStepThreeHandler(
      {required int status, required BuildContext context}) async {
    try {
      setIsloading = true;
      loanValidateMap = await ApplyLoanAPI().loanValidateStep3EndPoints(
          preferredBusinessType: applyLoanMap['bankType'],
          type: applyLoanMap['loanType'],
          amount: int.parse(applyLoanMap['amount']),
          installmentNum: int.parse(applyLoanMap['installments']),
          status: status,
          context: context);
      setIsloading = false;
      if (loanValidateMap['result'] == true) {
        return loanValidateMap = {
          'result': true,
          'message': loanValidateMap['message'],
          'error': ''
        };
      } else {
        var error = loanValidateMap['error'];
        bool containsServer = error.containsKey('server');
        bool containsMsg = error.containsKey('fields');
        bool containsdb = error.containsKey('db');

        if (containsServer == true) {
          errorMessage = '${error['server']['msg_en']}';
        } else if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
        } else if (containsdb == true) {
          errorMessage = '${error['db']['msg_en']}';
        }
        CommonUi.simpleToast(message: errorMessage);

        debugPrint('error in loan validate step 3 : $errorMessage');
      }
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      loanValidateMap = {
        'result': false,
        "error": errorMessage,
      };
    } catch (e) {
      debugPrint('error in loan validate step 3 : $e');
    }
  }
}
