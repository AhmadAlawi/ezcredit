// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:ezcredit/api/generalApis/address_api.dart';
import 'package:ezcredit/globals.dart';
import 'package:ezcredit/model/address_model.dart';
import 'package:ezcredit/model/cities_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/generalWidgets/common_ui.dart';

class AddressController extends ChangeNotifier {
  dynamic result;

  Addressmodel? addressmodel;

  List<CitiesModel>? cities = [];

  Map<String, dynamic>? addressMap = {};

  Map pageData = {};

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

  dynamic errorMessage;

  Future checkAddressData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('address') == null ||
        prefs.getString('address') == 'null') {
      addressmodel = await getAddressInfoHandler(context);
    }
    notifyListeners();
  }

  Future<Addressmodel?> getAddressInfoHandler(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setIsloading = true;
      addressmodel = await AddressAPI().getAddressInfoEndPoints(context);

      if (addressmodel != null) {
        await prefs.setString('address', '${addressmodel?.address}');
        await prefs.setString('streetName', '${addressmodel?.streetName}');
        await prefs.setString(
            'buildingNumber', '${addressmodel?.buildingNumber}');
        await prefs.setString('cityEn', '${addressmodel?.cityEn}');
        await prefs.setString('cityAr', '${addressmodel?.cityAr}');
        await prefs.setInt('cityId', addressmodel?.cityId ?? 0);
      } else {
        var error = AddressAPI().errorMessage;
        bool containsMsg = error.containsKey('fields');
        bool containsServer = error.containsKey('server');
        if (containsServer == true) {
          errorMessage = '${error['server']['msg_en']}';
          CommonUi.simpleToast(message: errorMessage);
        } else if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
          CommonUi.simpleToast(message: errorMessage);
        }
      }
      setIsloading = false;
      notifyListeners();

      return addressmodel;
    } catch (e) {
      setIsloading = false;
      errorMessage = AddressAPI().errorMessage;
    }
    return addressmodel;
  }

  Future<Map<String, dynamic>?> addAddressInfoHandler({
    required String address,
    required String stname,
    required String bldnum,
    required int city,
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      setPostloading = true;

      addressMap = await AddressAPI()
          .updateAddressInfoEndPoints(city, address, stname, bldnum, context);
      setPostloading = false;

      if (addressMap?['result'] == false) {
        var error = addressMap?['error'];
        bool containsServer = error.containsKey('server');
        bool containsMsg = error.containsKey('fields');
        if (containsServer == true) {
          errorMessage = '${error['server']['msg_en']}';
          CommonUi.simpleToast(message: errorMessage);
        } else if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
          CommonUi.simpleToast(message: errorMessage);
        }
      } else {
        prefs.setString('address', address);
        prefs.setString('streetName', stname);
        prefs.setString('buildingNumber', bldnum);

        prefs.setString('cityAr', '$userCityAR');
        prefs.setString('cityEn', '$userCityEN');
        prefs.setInt('cityId', city);

        notifyListeners();
        CommonUi.simpleToast(message: 'Added Successfully');
      }
      return addressMap;
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      addressMap = {
        'result': false,
        "error": errorMessage,
      };
      return addressMap;
    } catch (e) {
      setPostloading = false;
    }
  }
}
