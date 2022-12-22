// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:ezcredit/model/financial_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../controller/auth_controller.dart';
import '../../globals.dart';
import '../end_points.dart';

class FinancialAPI {
  static final FinancialAPI _appManager = FinancialAPI._internal();

  factory FinancialAPI() {
    return _appManager;
  }

  FinancialAPI._internal();

  dynamic errorMessage;

  // ************************************* GET FINANCIAL INFO API *************************************

  Future<FinancialModel?> getFinancialInfoEndpoints(
      BuildContext context) async {
    late FinancialModel financialModel;

    try {
      var url = Uri.parse(
          '${EndPoints.server}${EndPoints.getFinancialInfo}?userid=$userId');

      http.Response res = await http.get(
        url,
        headers: {'auth': authToken, "Content-Type": "application/json"},
      );
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        financialModel = FinancialModel.fromJson(json['data']);
        return financialModel;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors'];
        }
      }
    } catch (e) {
      debugPrint('Error in get financial info :  $errorMessage');
    }
  }

  // ************************************* UPDATE FINANCIAL INFO API *************************************

  Future<Map<String, dynamic>?> updateFinancialInfoEndPoints(
      totalLiabilities,
      loan,
      otherLiabilities,
      creditCard,
      totalMonthlyInstallment,
      BuildContext context) async {
    Map<String, dynamic> financialMap = {};
    try {
      var url =
          Uri.parse('${EndPoints.server}${EndPoints.updateFinancialInfo}');

      var body = jsonEncode({
        "userid": userId,
        "total_liabilities": totalLiabilities,
        "loan": loan,
        "other_liabilities": otherLiabilities,
        "credit_card": creditCard,
        "total_monthly_installment": totalMonthlyInstallment,
      });

      http.Response res = await http.post(url,
          headers: {'auth': authToken, "Content-Type": "application/json"},
          body: body);

      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        financialMap = {"result": json['success'], "error": ''};
        return financialMap;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors'];
          financialMap = {"result": json['success'], "error": errorMessage};
        }
      }
    } catch (e) {
      financialMap = {
        "result": false,
        "error": "error in add employee Info : $e"
      };
    }
  }
}
