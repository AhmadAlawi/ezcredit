// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/apply_controller.dart';
import 'package:ezcredit/controller/profile_controller.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/general_controller.dart';
import '../../globals.dart';
import '../../lang/change_lang.dart';
import '../../lang/config.dart';
import '../../lang/key_lang.dart';
import '../../model/cities_model.dart';
import '../../model/country_model.dart';
import '../../service/generalServices/enums_value.dart';
import '../../service/generalServices/update_status.dart';
import '../../style/assets.dart';
import '../../style/form_style.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/drop_down.dart';

class PersonalFieldApply extends StatefulWidget {
  final int? status;

  const PersonalFieldApply({Key? key, this.status}) : super(key: key);

  @override
  State<PersonalFieldApply> createState() => _PersonalFieldApplyState();
}

class _PersonalFieldApplyState extends State<PersonalFieldApply> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameARController = TextEditingController();
  final TextEditingController nameENController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController civiIDController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  List<String> genders = local == ConfigLanguage.arLocale
      ? myMap['gender']['ar']
      : myMap['gender']['en'];

  String? genderValue;

  void updateClicks(BuildContext context) {
    Provider.of<ClickStatus>(context, listen: false).updateClick();
  }

  String? nationalityValue;

  List<String> countriesName = [];

  String? cityValue;
  List<CitiesModel>? cities;
  List<String> cityName = [];

  List<CountryModel>? countries = [];

  Future getProfileFromMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!mounted) return;
    await Provider.of<GeneralController>(context, listen: false)
        .getCitiesandCountries(context);
    final apply = Provider.of<ApplyController>(context, listen: false);
    if (apply.applyLoanMap.values.isEmpty) {
      await apply.initializeData(context);
    }

    setState(() {
      nameARController.text = apply.applyLoanMap['fullname_ar'];

      nameENController.text = apply.applyLoanMap['fullname_en'];
      genderValue = apply.applyLoanMap['gender'];

      nationalityValue = apply.applyLoanMap['country'];

      cityValue = apply.applyLoanMap['city'];
      cityName = prefs.getStringList('city') ?? [];
      countriesName = prefs.getStringList('country') ?? [];
      cities =
          Provider.of<GeneralController>(context, listen: false).citiesModel;
      civiIDController.text = apply.applyLoanMap['civilId'] ?? '';
      phoneNumberController.text = apply.applyLoanMap['phoneNumber'] ?? '';

      dateController.text = apply.applyLoanMap['birthDate'] ?? '';

      nationalityID = prefs.getInt('nationalityId') ?? 0;
      cityId = prefs.getInt('cityId') ?? 0;

      dateController.text = dateController.text.split('T').first;

      if (local == ConfigLanguage.arLocale) {
        genderValue == myMap['gender']['en'][0]
            ? genderValue = myMap['gender']['ar'][0]
            : genderValue = myMap['gender']['ar'][1];

        setState(() {});
      }
    });
  }

  DateTime selectedDate = DateTime(DateTime.now().year - 18, 12, 31);

  String formattedDate = "0000/00/00";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(DateTime.now().year - 18, 12, 31));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        dateController.text = formattedDate;
      });
    }
  }

  Color? colorBorder;

  @override
  void initState() {
    getProfileFromMap();
    countries =
        Provider.of<GeneralController>(context, listen: false).countriesModel;
    super.initState();
  }

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  ScrollController scrollController = ScrollController();

  FocusNode text1 = new FocusNode();
  FocusNode text2 = new FocusNode();
  FocusNode text3 = new FocusNode();
  FocusNode text4 = new FocusNode();
  FocusNode text5 = new FocusNode();
  FocusNode text6 = new FocusNode();
  FocusNode text7 = new FocusNode();
  FocusNode text8 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                KeyLang.fullNameAr.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text1,
                style: const TextStyle(color: Colors.black),
                controller: nameARController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle(KeyLang.arabicName.tr(),
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.fullNameEn.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text2,
                style: const TextStyle(color: Colors.black),
                controller: nameENController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle(KeyLang.civilIdCard.tr(),
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.civilID.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text3,
                style: const TextStyle(color: Colors.black),
                controller: civiIDController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  if (civiIDController.text.length != 12) {
                    return KeyLang.errorCivilId.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle(KeyLang.civilID.tr(),
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(KeyLang.nationality.tr()),
              SizedBox(
                height: 4.h,
              ),
              nationalityValue == ''
                  ? MainDropDownMenu(
                      items: countriesStrings ?? countriesName,
                      hint: KeyLang.select.tr(),
                      focusNode: text4,
                      //value: nationalityValue ?? 'Jordan',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return KeyLang.enterValue.tr();
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        int index = countriesStrings!.indexWhere((element) {
                          return element == value;
                        });
                        nationalityID = countries!.elementAt(index).id!;
                        userCountryEN = countries!.elementAt(index).nameEn;
                        userCountryAR = countries!.elementAt(index).nameAr;
                        pref.setInt('nationalityId', nationalityID);
                      })
                  : MainDropDownMenu(
                      items: countriesStrings ?? countriesName,
                      hint: KeyLang.select.tr(),
                      value: nationalityValue,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return KeyLang.enterValue.tr();
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        int index = countriesStrings!.indexWhere((element) {
                          return element == value;
                        });
                        nationalityID = countries!.elementAt(index).id!;
                        userCountryEN = countries!.elementAt(index).nameEn;
                        userCountryAR = countries!.elementAt(index).nameAr;
                        pref.setInt('nationalityId', nationalityID);
                      }),
              SizedBox(
                height: 18.h,
              ),
              Text(KeyLang.sex.tr()),
              SizedBox(
                height: 4.h,
              ),
              genderValue == null || genderValue == ''
                  ? MainDropDownMenu(
                      items: genders,
                      hint: KeyLang.select.tr(),
                      focusNode: text5,
                      //value: genderValue == '' ? KeyLang.sex.tr() : genderValue,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return KeyLang.enterValue.tr();
                        }
                        return null;
                      },
                      onChanged: (value) {
                        genderValue = value;
                      })
                  : MainDropDownMenu(
                      items: genders,
                      hint: KeyLang.select.tr(),
                      value: genderValue,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return KeyLang.enterValue.tr();
                        }
                        return null;
                      },
                      onChanged: (value) {
                        genderValue = value;
                      }),
              SizedBox(
                height: 18.h,
              ),
              Text(KeyLang.city.tr()),
              SizedBox(
                height: 4.h,
              ),
              cityValue == '' || cityValue == null
                  ? MainDropDownMenu(
                      items: citiesStrings ?? cityName,
                      hint: KeyLang.select.tr(),
                      focusNode: text6,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return KeyLang.enterValue.tr();
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        int index = citiesStrings!.indexWhere((element) {
                          return element == value;
                        });
                        cityId = cities!.elementAt(index).id!;
                        userCityEN = cities!.elementAt(index).nameEn;
                        userCityAR = cities!.elementAt(index).nameAr;
                        pref.setInt('cityId', cityId);
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
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        int index = citiesStrings!.indexWhere((element) {
                          return element == value;
                        });
                        cityId = cities!.elementAt(index).id!;
                        userCityEN = cities!.elementAt(index).nameEn;
                        userCityAR = cities!.elementAt(index).nameAr;
                        pref.setInt('cityId', cityId);
                      }),
              SizedBox(
                height: 18.h,
              ),
              Text(KeyLang.birthDate.tr()),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                readOnly: true,
                focusNode: text7,
                onTap: () => _selectDate(context),
                style: const TextStyle(color: Colors.black),
                controller: dateController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      dateController.text == '0000/00/00') {
                    return KeyLang.enterValue.tr();
                  }

                  return null;
                },
                decoration: AppStyles.formStyle(KeyLang.birthDate.tr(),
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    suffixIcon: IconButton(
                      onPressed: () => _selectDate(context),
                      icon: SvgPicture.asset(
                        SvgAssets.date,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              const Text(
                'Mobile Number',
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                style: const TextStyle(color: Colors.black),
                focusNode: text8,
                controller: phoneNumberController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  if (phoneNumberController.text.length != 8) {
                    return KeyLang.errorPhoneNumber.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle(KeyLang.phoneNumber.tr(),
                    radius: 8.r,
                    prefixIcon: const Text("+965"),
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ApplyController>(
                      builder: (context, applyController, child) {
                    return MainButton(
                      text: '${KeyLang.next.tr()} >>',
                      color: AppColors.buttonColor,
                      radius: 10.r,
                      width: 120.w,
                      isDisabled: applyController.isLoading,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          profile = true;
                          genderValue == genders[0]
                              ? genderValue = myMap['gender']['en'][0]
                              : genderValue = myMap['gender']['en'][1];

                          colorBorder = AppColors.formBorderColor;
                          await applyController.saveDataHandlerData(applyMap: {
                            'fullname_en': nameENController.text,
                            'fullname_ar': nameARController.text,
                            'gender': genderValue,
                            'country': local == ConfigLanguage.arLocale
                                ? userCountryAR
                                : userCountryEN,
                            'city': local == ConfigLanguage.arLocale
                                ? userCityAR
                                : userCityEN,
                            'civilId': civiIDController.text,
                            'phoneNumber': phoneNumberController.text,
                            'birthDate': dateController.text
                          }).then((value) async {
                            Map<String, dynamic>? validateOneMap = {};
                            validateOneMap =
                                await applyController.loanValidateStep1Handler(
                                    status: widget.status ?? 0,
                                    context: context);

                            if (validateOneMap?['result'] == true) {
                              if (!mounted) return;
                              Provider.of<ProfileController>(context,
                                      listen: false)
                                  .addProfileInfoHandler(
                                      fullnameAr: nameARController.text,
                                      fullnameEn: nameENController.text,
                                      gender: '$genderValue',
                                      nationality: nationalityID,
                                      birthDate: dateController.text,
                                      cityId: cityId,
                                      civilId: int.parse(civiIDController.text),
                                      phone:
                                          int.parse(phoneNumberController.text),
                                      context: context);
                              updateClicks(context);
                            }
                          });
                        } else {
                          autoValidate = AutovalidateMode.onUserInteraction;
                          if (nameARController.text.isEmpty) {
                            text1.requestFocus();
                          } else if (nameENController.text.isEmpty) {
                            text2.requestFocus();
                          } else if (civiIDController.text.isEmpty) {
                            text3.requestFocus();
                          } else if (nationalityValue!.isEmpty) {
                            text4.requestFocus();
                          } else if (genderValue!.isEmpty) {
                            text5.requestFocus();
                          } else if (cityValue!.isEmpty) {
                            text6.requestFocus();
                          } else if (dateController.text.isEmpty) {
                            text7.requestFocus();
                          } else if (phoneNumberController.text.isEmpty) {
                            text8.requestFocus();
                          }
                          setState(() {});
                        }
                      },
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
