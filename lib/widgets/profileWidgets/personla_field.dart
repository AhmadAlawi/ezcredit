// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/general_controller.dart';
import 'package:ezcredit/controller/profile_controller.dart';
import 'package:ezcredit/globals.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:ezcredit/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../lang/change_lang.dart';
import '../../lang/key_lang.dart';
import '../../service/generalServices/enums_value.dart';
import '../../service/generalServices/update_status.dart';
import '../../style/assets.dart';
import '../../style/form_style.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/drop_down.dart';
import '../generalWidgets/main_button.dart';

class PersonalInfoField extends StatefulWidget {
  const PersonalInfoField({Key? key}) : super(key: key);

  @override
  State<PersonalInfoField> createState() => _PersonalInfoFieldState();
}

class _PersonalInfoFieldState extends State<PersonalInfoField> {
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

  List<CountryModel>? countries = [];

  Future getProfileFromSharedPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await Provider.of<GeneralController>(context, listen: false)
        .getCountriesHandler(context);

    nameARController.text = prefs.getString('fullname_ar') == null ||
            prefs.getString('fullname_ar') == "null"
        ? ''
        : '${prefs.getString('fullname_ar')}';

    nameENController.text = prefs.getString('fullname_en') == null ||
            prefs.getString('fullname_en') == "null"
        ? ''
        : '${prefs.getString('fullname_en')}';
    genderValue =
        prefs.getString('gender') == null || prefs.getString('gender') == "null"
            ? ''
            : '${prefs.getString('gender')}';
    nationalityValue = local == ConfigLanguage.arLocale
        ? prefs.getString('country_ar') == null ||
                prefs.getString('country_ar') == 'null'
            ? ''
            : '${prefs.getString('country_ar')}'
        : prefs.getString('country_en') == null ||
                prefs.getString('country_en') == 'null'
            ? ''
            : '${prefs.getString('country_en')}';
    dateController.text = prefs.getString('birth_date') == null ||
            prefs.getString('birth_date') == "null"
        ? ''
        : '${prefs.getString('birth_date')}';

    phoneNumberController.text =
        prefs.getString('phone') == null || prefs.getString('phone') == 'null'
            ? ''
            : '${prefs.getString('phone')}';

    civiIDController.text = prefs.getString('civilId') == null ||
            prefs.getString('civilId') == 'null'
        ? ''
        : '${prefs.getString('civilId')}';

    countriesName = prefs.getStringList('country') ?? [];

    nationalityID = prefs.getInt('nationalityId') ?? 0;

    dateController.text = dateController.text.split('T').first;

    if (local == ConfigLanguage.arLocale) {
      genderValue == myMap['gender']['en'][0]
          ? genderValue = myMap['gender']['ar'][0]
          : genderValue = myMap['gender']['ar'][1];

      setState(() {});
    }

    setState(() {});
  }

  @override
  void initState() {
    getProfileFromSharedPrefrence();
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

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(builder: (context, data, child) {
      return Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          controller: scrollController,
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
                Text(KeyLang.sex.tr()),
                SizedBox(
                  height: 4.h,
                ),
                genderValue == null || genderValue == ''
                    ? MainDropDownMenu(
                        items: genders,
                        focusNode: text3,
                        hint: KeyLang.select.tr(),
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
                Text(
                  KeyLang.civilID.tr(),
                ),
                SizedBox(
                  height: 4.h,
                ),
                TextFormField(
                  autofocus: false,
                  focusNode: text4,
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
                Text(
                  KeyLang.phoneNumber.tr(),
                ),
                SizedBox(
                  height: 4.h,
                ),
                TextFormField(
                  autofocus: false,
                  focusNode: text5,
                  style: const TextStyle(color: Colors.black),
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
                  height: 18.h,
                ),
                Text(KeyLang.birthDate.tr()),
                SizedBox(
                  height: 4.h,
                ),
                TextFormField(
                  autofocus: false,
                  focusNode: text6,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  style: const TextStyle(color: Colors.black),
                  controller: dateController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
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
                Text(KeyLang.nationality.tr()),
                SizedBox(
                  height: 4.h,
                ),
                nationalityValue == '' ||
                        nationalityValue == null ||
                        nationalityValue == 'null'
                    ? MainDropDownMenu(
                        items: countriesStrings ?? countriesName,
                        hint: KeyLang.select.tr(),
                        focusNode: text7,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return KeyLang.enterValue.tr();
                          }
                          return null;
                        },
                        onChanged: (value) async {
                          int index = countriesStrings!.indexWhere((element) {
                            return element == value;
                          });
                          nationalityID = countries!.elementAt(index).id!;
                          userCountryEN = countries!.elementAt(index).nameEn;
                          userCountryAR = countries!.elementAt(index).nameAr;
                        })
                    : MainDropDownMenu(
                        items: countriesStrings ?? [],
                        hint: KeyLang.select.tr(),
                        value: nationalityValue,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return KeyLang.enterValue.tr();
                          }
                          return null;
                        },
                        onChanged: (value) async {
                          int index = countriesStrings!.indexWhere((element) {
                            return element == value;
                          });
                          nationalityID = countries!.elementAt(index).id!;
                          userCountryEN = countries!.elementAt(index).nameEn;
                          userCountryAR = countries!.elementAt(index).nameAr;
                        }),
                SizedBox(
                  height: 30.h,
                ),
                Consumer<ProfileController>(
                    builder: (context, profileController, child) {
                  return MainButton(
                      text: KeyLang.save.tr(),
                      width: double.infinity,
                      radius: 8.r,
                      color: AppColors.buttonColor,
                      isDisabled: profileController.postLoading,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          profile = false;
                          genderValue == genders[0]
                              ? genderValue = myMap['gender']['en'][0]
                              : genderValue = myMap['gender']['en'][1];
                          await profileController.addProfileInfoHandler(
                              fullnameAr: nameARController.text,
                              fullnameEn: nameENController.text,
                              gender: '$genderValue',
                              nationality: nationalityID,
                              birthDate: dateController.text,
                              phone: int.parse(phoneNumberController.text),
                              civilId: int.parse(civiIDController.text),
                              context: context);
                          if (local == ConfigLanguage.arLocale) {
                            genderValue == myMap['gender']['en'][0]
                                ? genderValue = myMap['gender']['ar'][0]
                                : genderValue = myMap['gender']['ar'][1];

                            setState(() {});
                          }
                        } else {
                          autoValidate = AutovalidateMode.onUserInteraction;
                          if (nameARController.text.isEmpty) {
                            text1.requestFocus();
                          } else if (nameENController.text.isEmpty) {
                            text2.requestFocus();
                          } else if (genderValue!.isEmpty) {
                            text3.requestFocus();
                          } else if (civiIDController.text.isEmpty) {
                            text4.requestFocus();
                          } else if (phoneNumberController.text.isEmpty) {
                            text5.requestFocus();
                          } else if (dateController.text.isEmpty) {
                            text6.requestFocus();
                          } else if (nationalityValue!.isEmpty) {
                            text7.requestFocus();
                          }
                          setState(() {});
                        }
                      });
                }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
