// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:ezcredit/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../controller/auth_controller.dart';
import '../../globals.dart';
import '../end_points.dart';

class HomeDataAPI extends ChangeNotifier {
  static final HomeDataAPI _appManager = HomeDataAPI._internal();

  factory HomeDataAPI() {
    return _appManager;
  }

  HomeDataAPI._internal();

  dynamic errorMessage;

  Future getHomeDataEndPoints(BuildContext context) async {
    late HomeDataModel homeDataModel;

    try {
      var url = Uri.parse(
          '${EndPoints.server}${EndPoints.homeDataApi}?userid=$userId');

      http.Response res = await http.get(
        url,
        headers: {'auth': authToken, "Content-Type": "application/json"},
      );

      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        homeDataModel = HomeDataModel.fromJson(json);
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors']['server']['msg_en'];
        }
      }
    } catch (e) {
      debugPrint('Error in get home Data :  $e');
    }
    return homeDataModel;
  }
}
