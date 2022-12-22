// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:ezcredit/model/lenders_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../controller/auth_controller.dart';
import '../end_points.dart';

class LendersAPI {
  static final LendersAPI _appManager = LendersAPI._internal();

  factory LendersAPI() {
    return _appManager;
  }

  LendersAPI._internal();

  bool isLoading = false;
  dynamic errorMessage;

  // ************************************* GET TESTIMONIALS API *************************************

  Future<List<LendersModel>?> getLendersEndPoints(BuildContext context) async {
    late List<LendersModel> lendersModel = [];

    try {
      isLoading = true;
      var url = Uri.parse('${EndPoints.server}${EndPoints.getLenders}');
      http.Response res = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var lenders = json['data'];

        for (int i = 0; i <= lenders.length; i++) {
          lendersModel.add(LendersModel.fromJson(lenders[i]));
        }
        isLoading = false;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors'];
        }
      }
    } on SocketException {
      isLoading = false;
      errorMessage = 'No internet, Please connect to internet';
    } catch (e) {
      errorMessage = "error in get testimonials = $e";
      isLoading = false;
    }
    return lendersModel;
  }
}
