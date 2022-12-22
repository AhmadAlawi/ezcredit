import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/employment_controller.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../controller/apply_controller.dart';
import '../../lang/change_lang.dart';
import '../../lang/config.dart';
import '../../lang/key_lang.dart';
import '../../service/generalServices/enums_value.dart';
import '../../service/generalServices/update_status.dart';
import '../../style/form_style.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/common_ui.dart';
import '../generalWidgets/drop_down.dart';
import '../profileWidgets/profile_textfield.dart';

class EmploymentFieldApply extends StatefulWidget {
  final int? status;
  const EmploymentFieldApply({Key? key, this.status}) : super(key: key);

  @override
  State<EmploymentFieldApply> createState() => _EmploymentFieldApplyState();
}

class _EmploymentFieldApplyState extends State<EmploymentFieldApply> {
  List<String> emplymentStatus = local == ConfigLanguage.arLocale
      ? myMap['employment_status']['ar']
      : myMap['employment_status']['en'];

  List<String> emplyerType = local == ConfigLanguage.arLocale
      ? myMap['employer_type']['ar']
      : myMap['employer_type']['en'];

  String? employedValue;
  String? employerStatus;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController employerController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();

  void updateClicks(BuildContext context) {
    Provider.of<ClickStatus>(context, listen: false).updateClick();
  }

  void decreaseClicks(BuildContext context) {
    Provider.of<ClickStatus>(context, listen: false).decreaseClick();
  }

  Future getEmploymentFromMap() async {
    if (!mounted) return;
    final apply = Provider.of<ApplyController>(context, listen: false);

    employerController.text =
        apply.applyLoanMap['status'] == myMap['employment_status']['en'][0]
            ? apply.applyLoanMap['employer']
            : '';

    incomeController.text = apply.applyLoanMap['income'];
    employedValue = apply.applyLoanMap['status'];

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
    getEmploymentFromMap();
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
                employedValue == '' || employedValue == null
                    ? MainDropDownMenu(
                        items: emplymentStatus,
                        hint: KeyLang.select.tr(),
                        focusNode: drop1,
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
                        decoration: AppStyles.formStyle("Sector Type",
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            radius: 8.r,
                            filledColor: AppColors.formFillColor,
                            borderColor: AppColors.formBorderColor,
                            focusBorderColor: AppColors.formBorderColor,
                            enabledBorderColor: AppColors.formBorderColor),
                      )
                    : MainDropDownMenu(
                        items: emplyerType,
                        value: employerStatus,
                        hint: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return KeyLang.enterValue.tr();
                          }
                          return null;
                        },
                        onChanged: (value) {
                          employerStatus = value;
                          if (employerStatus == emplyerType[0] ||
                              employerStatus == emplyerType[1] ||
                              employerStatus == emplyerType[2]) {
                            employerController.text;
                          } else {
                            employerController.text = '';
                          }
                          setState(() {});
                        }),
                SizedBox(
                  height: 18.h,
                ),
                ProfileTextField(
                  title: KeyLang.currency.tr(),
                  hint: "Kuwait Dinar",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainButton(
                        text: '<< ${KeyLang.previous.tr()}',
                        radius: 10.r,
                        width: 120.w,
                        color: AppColors.lightGrey,
                        onPressed: () {
                          decreaseClicks(context);
                        }),
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
                              employerStatus =
                                  employedValue == emplymentStatus[0]
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
                              employerStatus == emplyerType[0]
                                  ? employerStatus =
                                      myMap['employer_type']['en'][0]
                                  : employerStatus == emplyerType[1]
                                      ? employerStatus =
                                          myMap['employer_type']['en'][1]
                                      : employerStatus =
                                          myMap['employer_type']['en'][2];

                              await applyController
                                  .saveDataHandlerData(applyMap: {
                                'income': incomeController.text,
                                'status': employedValue?.toLowerCase(),
                                'currency': 'KWD',
                                'employer': employedValue == emplymentStatus[0]
                                    ? employerController.text
                                    : 'unemployed',
                              }).then((value) async {
                                Map<String, dynamic>? validateTwoMap = {};
                                validateTwoMap = await applyController
                                    .loanValidateStepTwoHandler(
                                        status: widget.status ?? 0,
                                        context: context);

                                if (validateTwoMap?['result'] == true) {
                                  if (!mounted) return;
                                  Provider.of<EmploymentController>(context,
                                          listen: false)
                                      .addEmploymentInfoHandler(
                                          employer: employedValue ==
                                                  emplymentStatus[0]
                                              ? employerController.text
                                              : 'unemployed',
                                          status:
                                              employedValue?.toLowerCase() ??
                                                  '',
                                          income:
                                              int.parse(incomeController.text),
                                          context: context);
                                  updateClicks(context);
                                } else {
                                  if (!mounted) return;

                                  CommonUi.snackBar(
                                      context, 'Please Fill All Fields');
                                }
                              });
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
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
