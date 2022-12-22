// ignore_for_file: use_build_context_synchronously

import 'package:ezcredit/api/generalApis/profile_info_api.dart';
import 'package:ezcredit/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../globals.dart';
import '../model/profile_info_model.dart';
import '../widgets/generalWidgets/common_ui.dart';
import '../lang/change_lang.dart';
import '../lang/config.dart';

class ProfileController extends ChangeNotifier {
  dynamic result;
  Map pageData = {};
  List<CountryModel>? countries = [];

  ProfileInfoModel? profileInfoModel;

  Map<String, dynamic> profileMap = {};

  bool isLoading = false;
  bool postLoading = false;
  set setIsloading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set setPostloading(bool value) {
    postLoading = value;
    notifyListeners();
  }

  String errorMessage = '';

  Future checkProfileData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('fullname_en') == null ||
        prefs.getString('fullname_en') == 'null') {
      profileInfoModel = await getProfileInfoHandler(context);
    }
    notifyListeners();
  }

  Future<ProfileInfoModel?> getProfileInfoHandler(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      setIsloading = true;
      profileInfoModel = await ProfileAPI().getProfileInfoEndPoints(context);

      if (profileInfoModel != null) {
        await prefs.setString('fullname_en', '${profileInfoModel?.fullnameEn}');
        await prefs.setString('fullname_ar', '${profileInfoModel?.fullnameAr}');
        await prefs.setString('gender', '${profileInfoModel?.gender}');
        await prefs.setString('birth_date', '${profileInfoModel?.birthDate}');
        prefs.setString('country_ar', '${profileInfoModel?.countryAr}');
        prefs.setString('country_en', '${profileInfoModel?.countryEn}');
        await prefs.setString('civilId', '${profileInfoModel?.civilId}');
        await prefs.setString('phone', '${profileInfoModel?.phone}');
        await prefs.setInt('nationalityId', profileInfoModel?.nationality ?? 0);
        await prefs.setString('cityEn', '${profileInfoModel?.cityEn}');
        await prefs.setString('cityAr', '${profileInfoModel?.cityAr}');
        await prefs.setInt('cityId', profileInfoModel?.cityId ?? 0);
      } else {
        var error = ProfileAPI().errorMessage;
        bool containsMsg = error.containsKey('fields');

        if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
          CommonUi.snackBar(context, errorMessage);
        }
      }
      setIsloading = false;
      notifyListeners();

      return profileInfoModel;
    } catch (e) {
      setIsloading = false;

      errorMessage = ProfileAPI().errorMessage;
      CommonUi.snackBar(context, errorMessage);
    }
  }

  Future<Map<String, dynamic>?> addProfileInfoHandler(
      {required String fullnameAr,
      required String fullnameEn,
      required String gender,
      required int nationality,
      required String birthDate,
      required int civilId,
      required int phone,
      int? cityId,
      required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      setPostloading = true;
      profileMap = await ProfileAPI().addProfileInfoEndPoints(
          fullnameAr: fullnameAr,
          fullnameEn: fullnameEn,
          gender: gender,
          nationality: nationality,
          birthDate: birthDate,
          civilId: civilId,
          cityId: cityId,
          phone: phone,
          context: context);

      setPostloading = false;

      if (profileMap['result'] == true) {
        prefs.setString('fullname_en', fullnameEn);
        prefs.setString('fullname_ar', fullnameAr);
        prefs.setString('gender', gender);
        prefs.setString('birth_date', birthDate);
        prefs.setString('country_ar', '$userCountryAR');
        prefs.setString('country_en', '$userCountryEN');
        prefs.setString('phone', '$phone');
        prefs.setString('civilId', '$civilId');
        prefs.setInt('nationalityId', nationality);
        prefs.setString('cityEn', '$userCityEN');
        prefs.setString('cityAr', '$userCityAR');

        if (profile == false) {
          CommonUi.simpleToast(message: 'Added Successfully');
        }
      } else {
        var error = profileMap['error'];
        bool containsServer = error.containsKey('server');
        bool containsMsg = error.containsKey('fields');
        if (containsServer == true) {
          errorMessage = '${error['server']['msg_en']}';
        } else if (containsMsg == true) {
          errorMessage = '${error['fields']['msg_en']}';
        }
        CommonUi.snackBar(context, errorMessage);
      }
    } catch (e) {
      postLoading = false;
      //CommonUi.snackBar(context, errorMessage);
    }
  }

  Future getProfileFromSharedPrefrence(BuildContext context) async {
    // setIsloading = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    pageData["fullname_ar"] = prefs.getString('fullname_ar') == 'null'
        ? ''
        : '${prefs.getString('fullname_ar')}';

    pageData["fullname_en"] = prefs.getString('fullname_en') == 'null'
        ? ''
        : '${prefs.getString('fullname_en')}';
    pageData["gender"] = prefs.getString('gender') == 'null'
        ? ''
        : '${prefs.getString('gender')}';
    pageData["country_en"] = local == ConfigLanguage.enLocale
        ? prefs.getString('country_en') == 'null'
            ? ''
            : '${prefs.getString('country_en')}'
        : prefs.getString('country_ar') == 'null'
            ? ''
            : '${prefs.getString('country_ar')}';
    pageData["birth_date"] = prefs.getString('birth_date') == 'null'
        ? ''
        : '${prefs.getString('birth_date')}';
    //setIsloading = false;

    notifyListeners();
  }
}
