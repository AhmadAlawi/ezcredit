// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../controller/auth_controller.dart';
import '../../globals.dart';
import '../../model/offers_model.dart';
import '../end_points.dart';

class OffersAPI extends ChangeNotifier {
  static final OffersAPI _appManager = OffersAPI._internal();

  factory OffersAPI() {
    return _appManager;
  }

  OffersAPI._internal();

  dynamic errorMessage;

  Future<List<OffersModel>?> getOffersEndPoints(BuildContext context) async {
    late List<OffersModel> offersModel = [];

    try {
      var url =
          Uri.parse('${EndPoints.server}${EndPoints.getOffers}?userid=$userId');

      http.Response res = await http.get(
        url,
        headers: {'auth': authToken, "Content-Type": "application/json"},
      );

      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var offer = json['data'];

        for (int i = 0; i <= offer.length; i++) {
          offersModel.add(OffersModel.fromJson(offer[i]));
        }
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors']['server']['msg_en'];
        }
      }
    } catch (e) {
      debugPrint('Error in get offers :  $e');
    }
    return offersModel;
  }
}
