import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/globals.dart';
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
import '../generalWidgets/main_button.dart';
import '../profileWidgets/profile_textfield.dart';

class NewLoenWidget extends StatefulWidget {
  final int status;
  const NewLoenWidget({Key? key, required this.status}) : super(key: key);

  @override
  State<NewLoenWidget> createState() => _NewLoenWidgetState();
}

class _NewLoenWidgetState extends State<NewLoenWidget> {
  List<String> loanStatus = local == ConfigLanguage.arLocale
      ? myMap['loan_types']['ar']
      : myMap['loan_types']['en'];
  String? loanValue;

  List<String> bankStatus = local == ConfigLanguage.arLocale
      ? myMap['bank_type']['ar']
      : myMap['bank_type']['en'];
  String? bankValue;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController installmentsController = TextEditingController();

  void updateClicks(BuildContext context) {
    Provider.of<ClickStatus>(context, listen: false).updateClick();
  }

  void decreaseClicks(BuildContext context) {
    Provider.of<ClickStatus>(context, listen: false).decreaseClick();
  }

  @override
  void initState() {
    getNewLoanData();
    super.initState();
  }

  getNewLoanData() async {
    if (!mounted) return;
    final apply = Provider.of<ApplyController>(context, listen: false);

    amountController.text = apply.applyLoanMap['amount'];

    installmentsController.text = apply.applyLoanMap['installments'];
    bankValue = apply.applyLoanMap['bankType'];

    if (local == ConfigLanguage.arLocale) {
      bankValue == myMap['bank_type']['en'][0]
          ? bankValue = myMap['bank_type']['ar'][0]
          : bankValue == myMap['bank_type']['en'][1]
              ? bankValue = myMap['bank_type']['ar'][1]
              : bankValue = myMap['bank_type']['ar'][2];

      setState(() {});
    }

    setState(() {});
  }

  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  ScrollController scrollController = ScrollController();

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
            children: [
              SizedBox(
                height: 20.h,
              ),
              ProfileTextField(
                title: KeyLang.requestLoanType.tr(),
                hint: "$loanTitle",
                readOnly: true,
                filledColor: AppColors.formFillColor,
              ),
              Text(KeyLang.requestBanktype.tr()),
              SizedBox(
                height: 4.h,
              ),
              bankValue == null || bankValue == ''
                  ? MainDropDownMenu(
                      items: bankStatus,
                      hint: KeyLang.select.tr(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return KeyLang.enterValue.tr();
                        }
                        return null;
                      },
                      onChanged: (value) {
                        bankValue = value;
                      })
                  : MainDropDownMenu(
                      items: bankStatus,
                      hint: KeyLang.select.tr(),
                      value: bankValue,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return KeyLang.enterValue.tr();
                        }
                        return null;
                      },
                      onChanged: (value) {
                        bankValue = value;
                      }),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.requestLoanAMount.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                style: const TextStyle(color: Colors.black),
                controller: amountController,
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
                height: 18.h,
              ),
              Text(
                KeyLang.installmentsNumber.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                style: const TextStyle(color: Colors.black),
                controller: installmentsController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle("60",
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(height: 50.h),
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
                            bankValue == bankStatus[0]
                                ? bankValue = myMap['bank_type']['en'][0]
                                : bankValue == bankStatus[1]
                                    ? bankValue = myMap['bank_type']['en'][1]
                                    : bankValue = myMap['bank_type']['en'][2];

                            log(bankValue.toString());
                            await applyController
                                .saveDataHandlerData(applyMap: {
                              'amount': amountController.text,
                              'installments': installmentsController.text,
                              'bankType': bankValue,
                              'loanType': loanTitle == KeyLang.housingLoan.tr()
                                  ? myMap['loan_types']['en'][1]
                                  : loanTitle == KeyLang.autoLoan.tr()
                                      ? myMap['loan_types']['en'][0]
                                      : loanTitle == KeyLang.personal.tr()
                                          ? myMap['loan_types']['en'][2]
                                          : myMap['loan_types']['en'][3]
                            }).then((value) async {
                              Map<String, dynamic>? validateThreeMap = {};
                              validateThreeMap = await applyController
                                  .loanValidateStepThreeHandler(
                                      status: widget.status, context: context);

                              if (validateThreeMap?['result'] == true) {
                                if (!mounted) return;

                                updateClicks(context);
                              } else {
                                if (!mounted) return;

                                CommonUi.snackBar(
                                    context, 'Please Fill All Fields');
                              }
                            });
                          } else {
                            autoValidate = AutovalidateMode.onUserInteraction;
                            scrollController.animateTo(0,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn);
                            setState(() {});
                          }
                        });
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
