// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/employment_controller.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:ezcredit/service/generalServices/enums_value.dart';
import 'package:ezcredit/widgets/profileWidgets/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../globals.dart';
import '../../lang/change_lang.dart';
import '../../lang/key_lang.dart';
import '../../service/generalServices/update_status.dart';
import '../../style/form_style.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/drop_down.dart';
import '../generalWidgets/main_button.dart';

class EmployementWidget extends StatefulWidget {
  final int? status;
  const EmployementWidget({Key? key, this.status}) : super(key: key);

  @override
  State<EmployementWidget> createState() => _EmployementWidgetState();
}

class _EmployementWidgetState extends State<EmployementWidget> {
  List<String> emplymentStatus = local == ConfigLanguage.arLocale
      ? myMap['employment_status']['ar']
      : myMap['employment_status']['en'];

  String? employedValue;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController employerController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();

  void updateClicks(BuildContext context) {
    Provider.of<ClickStatus>(context, listen: false).updateClick();
  }

  void decreaseClicks(BuildContext context) {
    Provider.of<ClickStatus>(context, listen: false).decreaseClick();
  }

  String? employerStatus;

  Future getEmploymentFromSharedPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    employedValue = prefs.getString('employmentStatus') == null ||
            prefs.getString('employmentStatus') == "null"
        ? ''
        : '${prefs.getString('employmentStatus')}';

    employerController.text = prefs.getString('employer') == null ||
            prefs.getString('employer') == "null"
        ? ''
        : prefs.getString('employer') == myMap['employment_status']['en'][1]
            ? ''
            : '${prefs.getString('employer')}';
    incomeController.text =
        prefs.getString('income') == null || prefs.getString('income') == "null"
            ? ''
            : '${prefs.getString('income')}';

    if (local == ConfigLanguage.arLocale) {
      employedValue == myMap['employment_status']['en'][0]
          ? employedValue = myMap['employment_status']['ar'][0]
          : employedValue == myMap['employment_status']['en'][1]
              ? employedValue = myMap['employment_status']['ar'][1]
              : employedValue = myMap['employment_status']['ar'][2];

      setState(() {});
    }

    setState(() {});
  }

  @override
  void initState() {
    getEmploymentFromSharedPrefrence();
    super.initState();
  }

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  FocusNode text2 = new FocusNode();
  FocusNode text3 = new FocusNode();
  FocusNode drop1 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
            key: formKey,
            autovalidateMode: autoValidate,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(KeyLang.emplymentStatus.tr()),
                  SizedBox(
                    height: 4.h,
                  ),
                  employedValue == ''
                      ? MainDropDownMenu(
                          items: emplymentStatus,
                          focusNode: drop1,
                          hint: KeyLang.select.tr(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return KeyLang.enterValue.tr();
                            }
                            return null;
                          },
                          onChanged: (value) {
                            employedValue = value;
                            if (employedValue == emplymentStatus[0]) {
                              employerController.text;
                            } else {
                              employerController.text = '';
                            }
                            setState(() {});
                          })
                      : MainDropDownMenu(
                          items: emplymentStatus,
                          value: employedValue,
                          hint: '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return KeyLang.enterValue.tr();
                            }
                            return null;
                          },
                          onChanged: (value) {
                            employedValue = value;
                            if (employedValue == emplymentStatus[0]) {
                              employerController.text;
                            } else {
                              employerController.text = '';
                            }
                            setState(() {});
                          }),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    KeyLang.employer.tr(),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  employedValue == emplymentStatus[1] ||
                          employedValue == emplymentStatus[2]
                      ? TextFormField(
                          autofocus: false,
                          readOnly: true,
                          focusNode: text2,
                          style: const TextStyle(color: Colors.black),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          decoration: AppStyles.formStyle(
                              "ABC trading and contracting Co.",
                              radius: 8.r,
                              filledColor: AppColors.formFillColor,
                              borderColor: AppColors.formBorderColor,
                              focusBorderColor: AppColors.formBorderColor,
                              enabledBorderColor: AppColors.formBorderColor),
                        )
                      : TextFormField(
                          autofocus: false,
                          focusNode: text2,
                          style: const TextStyle(color: Colors.black),
                          controller: employerController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty &&
                                    emplymentStatus[0] == employedValue) {
                              return KeyLang.enterValue.tr();
                            }
                            return null;
                          },
                          decoration: AppStyles.formStyle(
                              "ABC trading and contracting Co.",
                              radius: 8.r,
                              borderColor: AppColors.formBorderColor,
                              focusBorderColor: AppColors.formBorderColor,
                              enabledBorderColor: AppColors.formBorderColor),
                        ),
                  SizedBox(
                    height: 18.h,
                  ),
                  ProfileTextField(
                    title: KeyLang.currency.tr(),
                    hint: KeyLang.currencyK.tr(),
                    readOnly: true,
                    filledColor: AppColors.formFillColor,
                  ),
                  Text(
                    KeyLang.income.tr(),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    autofocus: false,
                    focusNode: text3,
                    style: const TextStyle(color: Colors.black),
                    controller: incomeController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return KeyLang.enterValue.tr();
                      }
                      return null;
                    },
                    decoration: AppStyles.formStyle("1000",
                        radius: 8.r,
                        borderColor: AppColors.formBorderColor,
                        focusBorderColor: AppColors.formBorderColor,
                        enabledBorderColor: AppColors.formBorderColor),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Consumer<EmploymentController>(
                      builder: (context, employmentProvider, child) {
                    return MainButton(
                        text: KeyLang.save.tr(),
                        width: double.infinity,
                        radius: 8.r,
                        color: AppColors.buttonColor,
                        isDisabled: employmentProvider.postLoading,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            profile = false;
                            employerStatus = employedValue == emplymentStatus[0]
                                ? employerController.text
                                : 'unemployed';
                            employedValue == emplymentStatus[0]
                                ? employedValue =
                                    myMap['employment_status']['en'][0]
                                : employedValue == emplymentStatus[1]
                                    ? employedValue =
                                        myMap['employment_status']['en'][1]
                                    : employedValue =
                                        myMap['employment_status']['en'][2];

                            await employmentProvider.addEmploymentInfoHandler(
                                employer: '$employerStatus',
                                status: '$employedValue',
                                income: int.parse(incomeController.text),
                                context: context);
                            if (local == ConfigLanguage.arLocale) {
                              employedValue ==
                                      myMap['employment_status']['en'][0]
                                  ? employedValue =
                                      myMap['employment_status']['ar'][0]
                                  : employedValue ==
                                          myMap['employment_status']['en'][1]
                                      ? employedValue =
                                          myMap['employment_status']['ar'][1]
                                      : employedValue =
                                          myMap['employment_status']['ar'][2];

                              setState(() {});
                            }
                          } else {
                            autoValidate = AutovalidateMode.onUserInteraction;
                            if (employerController.text.isEmpty) {
                              text2.requestFocus();
                            } else if (incomeController.text.isEmpty) {
                              text3.requestFocus();
                            } else if (employedValue!.isEmpty) {
                              drop1.requestFocus();
                            }
                            setState(() {});
                          }
                        });
                  }),
                ])),
      ),
    );
  }
}
