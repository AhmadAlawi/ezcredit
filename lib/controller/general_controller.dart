// ignore_for_file: use_build_context_synchronously

import 'package:ezcredit/api/generalApis/general_api.dart';
import 'package:ezcredit/globals.dart';
import 'package:ezcredit/lang/change_lang.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:ezcredit/model/cities_model.dart';
import 'package:ezcredit/model/config_model.dart';
import 'package:ezcredit/model/country_model.dart';
import 'package:ezcredit/model/testimonials_model.dart';
import 'package:ezcredit/widgets/generalWidgets/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/country_model.dart';

class GeneralController extends ChangeNotifier {
  List<CountryModel>? countriesModel = [];

  List<TestimonialsModel>? testimonialsModel = [];

  List<CitiesModel>? citiesModel = [];

  List<String> countriesName = [];

  List<String> citiesName = [];

  ConfigModel? configModel;

  int? countryid = 0;

  bool isLoading = false;
  String errorMessage = '';

  Future getCitiesandCountries(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await getCountriesHandler(context)
        .then((value) => getCitiesHandler(context));
    prefs.getStringList('city');
    prefs.getStringList('country');
    countriesStrings = prefs.getStringList('country');
    citiesStrings = prefs.getStringList('city');

    notifyListeners();
  }

  Future<ConfigModel?> configInfoHandler() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      String appVersion = packageInfo.version;

      configModel = await GeneralssAPI().configEndPoints(appVersion);

      return configModel;
    } catch (e) {
      errorMessage = GeneralssAPI().errorMessage;
      debugPrint('e $e');
    }
    return null;
  }

  Future<List<CountryModel>?> getCountriesHandler(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      isLoading = true;
      countriesModel = await GeneralssAPI().getCountriesEndPoinst(context);
      countriesName = List.generate(
          countriesModel!.length,
          (index) => local == ConfigLanguage.arLocale
              ? '${countriesModel?.elementAt(index).nameAr}'
              : '${countriesModel?.elementAt(index).nameEn}');
      prefs.setStringList('country', countriesName);
      countriesStrings = prefs.getStringList('country');

      for (int i = 0; i < countriesModel!.length; i++) {
        if (local == ConfigLanguage.enLocale) {
          if (countriesModel?[i].nameEn == 'Kuwait') {
            countryid = countriesModel![i].id;
            countryId = countryid;
          }
        } else {
          if (countriesModel?[i].nameEn == 'الكويت') {
            countryid = countriesModel![i].id;
            countryId = countryid;
          }
        }
      }

      if (countriesModel!.isNotEmpty) {
        isLoading = false;
      } else {
        isLoading = false;
        var error = GeneralssAPI().errorMessage;
        bool containsMsg = error.containsKey('server');
        if (containsMsg == true) {
          errorMessage = error['server']['msg_en'];
        } else {
          errorMessage = 'Failed To fetch data';
        }
        CommonUi.snackBar(context, errorMessage);
      }
      notifyListeners();
      return countriesModel;
    } catch (e) {
      errorMessage = GeneralssAPI().errorMessage;
      CommonUi.snackBar(context, errorMessage);
    }
    return countriesModel;
  }

  Future<List<TestimonialsModel>?> getTestimonialsHandler(
      BuildContext context) async {
    try {
      isLoading = true;
      testimonialsModel =
          await GeneralssAPI().getTestimonialsEndPoints(context);
      if (testimonialsModel!.isNotEmpty) {
        isLoading = false;
      } else {
        isLoading = false;
        errorMessage = GeneralssAPI().errorMessage;
      }
      notifyListeners();
      return testimonialsModel;
    } catch (e) {
      errorMessage = GeneralssAPI().errorMessage;
    }
    return null;
  }

  Future<List<CitiesModel>?> getCitiesHandler(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      isLoading = true;
      citiesModel = await GeneralssAPI().getCitiesEndPoints(countryId, context);
      citiesName = List.generate(
          citiesModel!.length,
          (index) => local == ConfigLanguage.arLocale
              ? '${citiesModel?.elementAt(index).nameAr}'
              : '${citiesModel?.elementAt(index).nameEn}');
      prefs.setStringList('city', citiesName);
      citiesStrings = prefs.getStringList('city');

      if (citiesModel!.isNotEmpty) {
        isLoading = false;
      } else {
        isLoading = false;
        var error = GeneralssAPI().errorMessage;
        bool containsMsg = error.containsKey('server');
        bool containsMsgDB = error.containsKey('db');

        if (containsMsg == true) {
          errorMessage = error['server']['msg_en'];
        } else if (containsMsgDB == true) {
          errorMessage = error['db']['msg_en'];
        } else {
          errorMessage = 'Failed To fetch data';
        }
        CommonUi.snackBar(context, errorMessage);
      }
      notifyListeners();
      return citiesModel;
    } catch (e) {
      errorMessage = GeneralssAPI().errorMessage;
      CommonUi.snackBar(context, errorMessage);
    }
    return citiesModel;
  }
}
