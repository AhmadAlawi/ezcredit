// ignore_for_file: use_build_context_synchronously

import 'package:ezcredit/api/generalApis/financial_api.dart';
import 'package:ezcredit/model/financial_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/generalWidgets/common_ui.dart';

class FinancialController extends ChangeNotifier {
  dynamic result;

  FinancialModel? financialModel;

  Map<String, dynamic>? financialMap = {};

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

  Future checkFinancialData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('totalMonthlyInstallments') == null ||
        prefs.getString('totalMonthlyInstallments') == 'null') {
      financialModel = await getFinancialInfoHandler(context);
    }
    notifyListeners();
  }

  Future<FinancialModel?> getFinancialInfoHandler(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setIsloading = true;
      financialModel = await FinancialAPI().getFinancialInfoEndpoints(context);
      if (financialModel != null) {
        await prefs.setString('totalMonthlyInstallments',
            '${financialModel?.totalMonthlyInstallments}');
        await prefs.setString('loan', '${financialModel?.loan}');
        await prefs.setString('creditCard', '${financialModel?.creditCard}');
        await prefs.setString(
            'otherLiabilities', '${financialModel?.otherLiabilities}');
        await prefs.setString(
            'totalLiabilities', '${financialModel?.totalLiabilities}');
      } else {
        var error = FinancialAPI().errorMessage;
        bool containsMsg = error.containsKey('fields');

        if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
          CommonUi.snackBar(context, errorMessage);
        }
      }
      setIsloading = false;
      return financialModel;
    } catch (e) {
      setIsloading = false;

      errorMessage = FinancialAPI().errorMessage;
      CommonUi.snackBar(context, errorMessage);
    }
    return financialModel;
  }

  Future<Map<String, dynamic>?> addFinancialInfoHandler({
    required int totalLiabilities,
    required int loan,
    required int otherLiabilities,
    required int creditCard,
    required int totalMonthlyInstallment,
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setPostloading = true;
      financialMap = await FinancialAPI().updateFinancialInfoEndPoints(
          totalLiabilities,
          loan,
          otherLiabilities,
          creditCard,
          totalMonthlyInstallment,
          context);
      setPostloading = false;
      if (financialMap!['result'] == true) {
        prefs.setString('totalMonthlyInstallments', '$totalLiabilities');
        prefs.setString('loan', '$loan');
        prefs.setString('creditCard', '$creditCard');
        prefs.setString('otherLiabilities', '$otherLiabilities');
        prefs.setString('totalLiabilities', '$totalLiabilities');
        CommonUi.simpleToast(message: 'Added Successfully');
      } else {
        var error = financialMap?['error'];
        bool containsServer = error.containsKey('server');
        bool containsMsg = error.containsKey('fields');
        if (containsServer == true) {
          errorMessage = '${error['server']['msg_en']}';
        } else if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
        }
        CommonUi.snackBar(context, errorMessage);
      }
      notifyListeners();
    } catch (e) {
      setPostloading = false;

      debugPrint('error in add financial = $e');
      errorMessage = financialMap?['error'];
      CommonUi.snackBar(context, errorMessage);
    }
  }
}
