// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:ezcredit/controller/auth_controller.dart';
import 'package:ezcredit/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../globals.dart';
import '../end_points.dart';

class AddressAPI {
  static final AddressAPI _appManager = AddressAPI._internal();

  factory AddressAPI() {
    return _appManager;
  }

  AddressAPI._internal();

  dynamic errorMessage;

  // ************************************* GET ADDRESS INFO API *************************************

  Future<Addressmodel> getAddressInfoEndPoints(BuildContext context) async {
    late Addressmodel addressmodel;

    try {
      var url = Uri.parse(
          '${EndPoints.server}${EndPoints.getAddressInfo}?userid=$userId');

      http.Response res = await http.get(
        url,
        headers: {'auth': authToken, "Content-Type": "application/json"},
      );

      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        addressmodel = Addressmodel.fromJson(json['data']);
        return addressmodel;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors'];
        }
      }
    } catch (e) {
      errorMessage = 'Error in get address info :  $e';
      debugPrint('Error in get address info :  $e');
    }
    return addressmodel;
  }

  // ************************************* UPDATE ADDRESS INFO API *************************************

  Future<Map<String, dynamic>?> updateAddressInfoEndPoints(
      city, address, stname, bldnum, BuildContext context) async {
    Map<String, dynamic> addressMap = {};

    try {
      var url = Uri.parse('${EndPoints.server}${EndPoints.updateAddressInfo}');

      var body = jsonEncode({
        "userid": userId,
        "country": countryId,
        "city": city,
        "address": address,
        "stname": stname,
        "bldnum": bldnum,
      });

      http.Response res = await http.post(url,
          headers: {'auth': authToken, "Content-Type": "application/json"},
          body: body);

      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        addressMap = {"result": json['success'], "error": ''};
        return addressMap;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors'];
          addressMap = {"result": json['success'], "error": errorMessage};
        }
      }
    } catch (e) {
      errorMessage = 'error in add address info = $e';
      addressMap = {"result": false, "error": errorMessage};
    }
  }
}
