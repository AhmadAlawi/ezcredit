import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/financial_controller.dart';
import 'package:ezcredit/model/financial_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../lang/key_lang.dart';
import '../../style/form_style.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/main_button.dart';

class FinancialWidget extends StatefulWidget {
  final FinancialModel? financialModel;
  const FinancialWidget({Key? key, this.financialModel}) : super(key: key);

  @override
  State<FinancialWidget> createState() => _FinancialWidgetState();
}

class _FinancialWidgetState extends State<FinancialWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController totlaLiabilitiesController =
      TextEditingController();
  final TextEditingController loansController = TextEditingController();
  final TextEditingController creditCardsController = TextEditingController();
  final TextEditingController otherController = TextEditingController();
  final TextEditingController totalMonthlyController = TextEditingController();

  Future getFinancialFromSharedPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    totalMonthlyController.text =
        prefs.getString('totalMonthlyInstallments') == null ||
                prefs.getString('totalMonthlyInstallments') == "null"
            ? ''
            : '${prefs.getString('totalMonthlyInstallments')}';

    loansController.text =
        prefs.getString('loan') == null || prefs.getString('loan') == "null"
            ? ''
            : '${prefs.getString('loan')}';
    creditCardsController.text = prefs.getString('creditCard') == null ||
            prefs.getString('creditCard') == "null"
        ? ''
        : '${prefs.getString('creditCard')}';
    otherController.text = prefs.getString('otherLiabilities') == null ||
            prefs.getString('otherLiabilities') == "null"
        ? ''
        : '${prefs.getString('otherLiabilities')}';
    totlaLiabilitiesController.text =
        prefs.getString('totalLiabilities') == null ||
                prefs.getString('totalLiabilities') == "null"
            ? ''
            : '${prefs.getString('totalLiabilities')}';
  }

  @override
  void initState() {
    getFinancialFromSharedPrefrence();
    super.initState();
  }

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  FocusNode text1 = new FocusNode();
  FocusNode text2 = new FocusNode();
  FocusNode text3 = new FocusNode();
  FocusNode text4 = new FocusNode();
  FocusNode text5 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                KeyLang.totalLiabilities.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text1,
                style: const TextStyle(color: Colors.black),
                controller: totlaLiabilitiesController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle("75000",
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.leons.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text2,
                style: const TextStyle(color: Colors.black),
                controller: loansController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle("65000",
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.creditCard.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text3,
                style: const TextStyle(color: Colors.black),
                controller: creditCardsController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle("10000",
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.other.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text4,
                style: const TextStyle(color: Colors.black),
                controller: otherController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle("0",
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                KeyLang.totalMonthlyInstallments.tr(),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                autofocus: false,
                focusNode: text5,
                style: const TextStyle(color: Colors.black),
                controller: totalMonthlyController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return KeyLang.enterValue.tr();
                  }
                  return null;
                },
                decoration: AppStyles.formStyle("400",
                    radius: 8.r,
                    borderColor: AppColors.formBorderColor,
                    focusBorderColor: AppColors.formBorderColor,
                    enabledBorderColor: AppColors.formBorderColor),
              ),
              SizedBox(
                height: 40.h,
              ),
              Consumer<FinancialController>(
                  builder: (context, financilaProvider, child) {
                return MainButton(
                    text: KeyLang.save.tr(),
                    width: double.infinity,
                    radius: 8.r,
                    color: AppColors.buttonColor,
                    isDisabled: financilaProvider.postLoading,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await financilaProvider.addFinancialInfoHandler(
                            totalLiabilities:
                                int.parse(totlaLiabilitiesController.text),
                            loan: int.parse(loansController.text),
                            otherLiabilities: int.parse(otherController.text),
                            creditCard: int.parse(creditCardsController.text),
                            totalMonthlyInstallment:
                                int.parse(totalMonthlyController.text),
                            context: context);
                      } else {
                        autoValidate = AutovalidateMode.onUserInteraction;
                        if (totlaLiabilitiesController.text.isEmpty) {
                          text1.requestFocus();
                        } else if (loansController.text.isEmpty) {
                          text2.requestFocus();
                        } else if (creditCardsController.text.isEmpty) {
                          text3.requestFocus();
                        } else if (otherController.text.isEmpty) {
                          text4.requestFocus();
                        } else {
                          text5.requestFocus();
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
  }
}
