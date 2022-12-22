// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/address_controller.dart';
import 'package:ezcredit/controller/general_controller.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:ezcredit/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../globals.dart';
import '../../lang/change_lang.dart';
import '../../lang/key_lang.dart';
import '../../model/cities_model.dart';
import '../../style/form_style.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/drop_down.dart';
import '../generalWidgets/main_button.dart';
import 'profile_textfield.dart';

class ResdentialWidget extends StatefulWidget {
  final Addressmodel? addressmodel;
  const ResdentialWidget({
    Key? key,
    this.addressmodel,
  }) : super(key: key);

  @override
  State<ResdentialWidget> createState() => _ResdentialWidgetState();
}

class _ResdentialWidgetState extends State<ResdentialWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController streetNameController = TextEditingController();
  final TextEditingController buildingNoController = TextEditingController();

  String? cityValue;
  List<CitiesModel>? cities;
  List<String> cityName = [];

  Future getAddressFromSharedPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await Provider.of<GeneralController>(context, listen: false)
        .getCitiesHandler(context);

    setState(() {
      cityName = prefs.getStringList('city') ?? [];
    });

    addressController.text = prefs.getString('address') == null ||
            prefs.getString('address') == 'null'
        ? ''
        : '${prefs.getString('address')}';

    streetNameController.text = prefs.getString('streetName') == null ||
            prefs.getString('streetName') == 'null'
        ? ''
        : '${prefs.getString('streetName')}';
    buildingNoController.text = prefs.getString('buildingNumber') == null ||
            prefs.getString('buildingNumber') == 'null'
        ? ''
        : '${prefs.getString('buildingNumber')}';
    cityValue = local == ConfigLanguage.arLocale
        ? prefs.getString('cityAr') == null ||
                prefs.getString('cityAr') == 'null'
            ? ''
            : '${prefs.getString('cityAr')}'
        : prefs.getString('cityEn') == null ||
                prefs.getString('cityEn') == 'null'
            ? ''
            : '${prefs.getString('cityEn')}';

    cityId = prefs.getInt('cityId') ?? 0;

    log('city === $cityValue');
  }

  @override
  void initState() {
    getAddressFromSharedPrefrence();
    cities = Provider.of<GeneralController>(context, listen: false).citiesModel;
    super.initState();
  }

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  ScrollController scrollController = ScrollController();

  FocusNode text1 = new FocusNode();
  FocusNode text2 = new FocusNode();
  FocusNode text3 = new FocusNode();
  FocusNode drop1 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        controller: scrollController,
        child: Form(
          key: formKey,
          autovalidateMode: autoValidate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileTextField(
                title: KeyLang.country.tr(),
                hint: "Kuwait",
                readOnly: true,
                filledColor: AppColors.formFillColor,
              ),
              Text(KeyLang.city.tr()),
              SizedBox(
                height: 4.h,
              ),
              cityValue == '' || cityValue == null
                  ? MainDropDownMenu(
                      items: citiesStrings ?? cityName,
                      focusNode: drop1,
                      hint: KeyLang.select.tr(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return KeyLang.enterValue.tr();
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        int index = citiesStrings!.indexWhere((element) {
                          return element == value;
                        });
                        cityId = cities!.elementAt(index).id!;
                        userCityEN = cities!.elementAt(index).nameEn;
                        userCityAR = cities!.elementAt(index).nameAr;
                      })
                  : MainDropDownMenu(
                      items: citiesStrings ?? cityName,
                      hint: KeyLang.select.tr(),
                      value: cityValue,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return KeyLang.enterValue.tr();
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        int index = citiesStrings!.indexWhere((element) {
                          return element == value;
                        });
                        cityId = cities!.elementAt(index).id!;
                        userCityEN = cities!.elementAt(index).nameEn;
                        userCityAR = cities!.elementAt(index).nameAr;
                      }),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.address.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text1,
                style: const TextStyle(color: Colors.black),
                controller: addressController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle("adipiscing elit",
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.street.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text2,
                style: const TextStyle(color: Colors.black),
                controller: streetNameController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle("adipiscing elit",
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.building.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text3,
                style: const TextStyle(color: Colors.black),
                controller: buildingNoController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle("20",
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 40.h,
              ),
              Consumer<AddressController>(
                  builder: (context, addressProvider, child) {
                return MainButton(
                    text: KeyLang.save.tr(),
                    width: double.infinity,
                    radius: 8.r,
                    color: AppColors.buttonColor,
                    isDisabled: addressProvider.postLoading,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await addressProvider.addAddressInfoHandler(
                            address: addressController.text,
                            stname: streetNameController.text,
                            bldnum: buildingNoController.text,
                            city: cityId,
                            context: context);
                      } else {
                        autoValidate = AutovalidateMode.onUserInteraction;
                        if (addressController.text.isEmpty) {
                          text1.requestFocus();
                        } else if (streetNameController.text.isEmpty) {
                          text2.requestFocus();
                        } else if (buildingNoController.text.isEmpty) {
                          text3.requestFocus();
                        } else if (cityValue!.isEmpty) {
                          drop1.requestFocus();
                        }
                        // scrollController.animateTo(0,
                        //     duration: const Duration(seconds: 1),
                        //     curve: Curves.easeIn);
                        setState(() {});
                      }
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
