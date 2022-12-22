// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:ezcredit/globals.dart';
import 'package:ezcredit/model/cities_model.dart';
import 'package:ezcredit/model/config_model.dart';
import 'package:ezcredit/model/country_model.dart';
import 'package:ezcredit/model/testimonials_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../controller/auth_controller.dart';
import '../end_points.dart';

class GeneralssAPI {
  static final GeneralssAPI _appManager = GeneralssAPI._internal();

  factory GeneralssAPI() {
    return _appManager;
  }

  GeneralssAPI._internal();

  bool isLoading = false;
  dynamic errorMessage;

  // ************************************* GONFIG API *************************************

  Future<ConfigModel?> configEndPoints(String appbuildversion) async {
    ConfigModel? configModel;
    var body = jsonEncode({"appbuildversion": appbuildversion});
    try {
      var url = Uri.parse('${EndPoints.server}${EndPoints.config}');
      http.Response res = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        configModel = ConfigModel.fromJson(json['data']);
        return configModel;
      } else {
        errorMessage = json['errors']['msg_en'];
      }
    } on SocketException {
      errorMessage = 'No internet, Please connect to internet';
      debugPrint("error in get config internet");
    } catch (e) {
      debugPrint("error in get config = $e");
    }
    return configModel;
  }

  // ************************************* GET TESTIMONIALS API *************************************

  Future<List<TestimonialsModel>?> getTestimonialsEndPoints(
      BuildContext context) async {
    late List<TestimonialsModel> testimonialModel = [];

    try {
      isLoading = true;
      var url = Uri.parse('${EndPoints.server}${EndPoints.testimonials}');
      http.Response res = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var testimonial = json['data'];

        for (int i = 0; i <= testimonial.length; i++) {
          testimonialModel.add(TestimonialsModel.fromJson(testimonial[i]));
        }
        isLoading = false;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors']['msg_en'];
        }
      }
    } on SocketException {
      isLoading = false;
      errorMessage = 'No internet, Please connect to internet';
    } catch (e) {
      errorMessage = "error in get testimonials = $e";
      isLoading = false;
    }
    return testimonialModel;
  }

  // ************************************* GET COUNTRIES API *************************************

  Future<List<CountryModel>> getCountriesEndPoinst(BuildContext context) async {
    var url = Uri.parse('${EndPoints.server}${EndPoints.getCountries}');

    late List<CountryModel> data = [];

    try {
      isLoading = true;

      http.Response res = await http.get(
        url,
        headers: {'auth': authToken, "Content-Type": "application/json"},
      );
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var country = json['data'];
        for (int i = 0; i <= country.length; i++) {
          data.add(CountryModel.fromJson(country[i]));
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
      errorMessage = "error in get country = $e";
      isLoading = false;
    }
    return data;
  }

  // ************************************* GET CITIES API *************************************

  Future<List<CitiesModel>> getCitiesEndPoints(
      int? country, BuildContext context) async {
    List<CitiesModel> citiesModel = [];
    try {
      var url = Uri.parse(
          '${EndPoints.server}${EndPoints.getCities}?country=$country');
      http.Response res = await http.get(
        url,
        headers: {'auth': authToken, "Content-Type": "application/json"},
      );
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var city = json['data'];

        for (int i = 0; i <= city.length; i++) {
          citiesModel.add(CitiesModel.fromJson(city[i]));
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
      errorMessage = "error in get city = $e";
      isLoading = false;
    }
    return citiesModel;
  }
}
