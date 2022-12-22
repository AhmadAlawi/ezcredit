// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/auth_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OtpForm extends StatefulWidget {
  final String? email;
  final String? password;
  const OtpForm({
    Key? key,
    this.email,
    this.password,
  }) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  final TextEditingController pin1Controller = TextEditingController();
  final TextEditingController pin2Controller = TextEditingController();
  final TextEditingController pin3Controller = TextEditingController();
  final TextEditingController pin4Controller = TextEditingController();
  final TextEditingController pin5Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  InputDecoration formStyle() {
    return InputDecoration(
      isDense: true,
      labelStyle: AppColors.fredoka.subtitle1,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.all(Radius.circular(3.r)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.all(Radius.circular(3.r)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(3.r)),
      ),
      errorStyle:
          AppColors.fredoka.caption!.copyWith(color: AppColors.errorColor),
      fillColor: Colors.transparent,
      filled: true,
    );
  }

  String otp = '00';
  String userOtp = '';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40.w,
                height: 55.h,
                child: TextFormField(
                  autofocus: true,
                  obscureText: false,
                  controller: pin1Controller,
                  style: TextStyle(fontSize: 20.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: formStyle(),
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                  validator: (value) {
                    if (value == null) {
                      return KeyLang.enterValue.tr();
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 40.w,
                height: 55.h,
                child: TextFormField(
                  controller: pin2Controller,
                  focusNode: pin2FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 20.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: formStyle(),
                  onChanged: (value) => nextField(value, pin3FocusNode),
                  validator: (value) {
                    if (value == null) {
                      return KeyLang.enterValue.tr();
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 40.w,
                height: 55.h,
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  controller: pin3Controller,
                  obscureText: false,
                  style: TextStyle(fontSize: 20.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: formStyle(),
                  onChanged: (value) {
                    nextField(value, pin4FocusNode);
                  },
                  validator: (value) {
                    if (value == null) {
                      return KeyLang.enterValue.tr();
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 40.w,
                height: 55.h,
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  controller: pin4Controller,
                  obscureText: false,
                  style: TextStyle(fontSize: 20.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: formStyle(),
                  onChanged: (value) => nextField(value, pin6FocusNode),
                  validator: (value) {
                    if (value == null) {
                      return KeyLang.enterValue.tr();
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 40.w,
                height: 55.h,
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  controller: pin5Controller,
                  obscureText: false,
                  style: TextStyle(fontSize: 20.sp),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: formStyle(),
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin6FocusNode!.unfocus();
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return KeyLang.enterValue.tr();
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.formBorderColor,
            height: 30.h,
          ),
          SizedBox(height: 30.h),
          Consumer<Authcontroller>(builder: (context, authcontroller, child) {
            return MainButton(
              text: 'Confirm Verification Code',
              width: double.infinity,
              color: AppColors.buttonColor,
              isDisabled: authcontroller.isLoading,
              radius: 10.r,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();

                  otp =
                      '${pin1Controller.text}${pin2Controller.text}${pin3Controller.text}${pin4Controller.text}${pin5Controller.text}';
                  userOtp = otp;
                  await authcontroller.checkOtpHandler(
                      userotp: int.parse(userOtp),
                      context: context,
                      email: widget.email,
                      password: widget.password);
                }
              },
            );
          }),
          // SizedBox(
          //   height: 130.h,
          // ),
          // TextButton(
          //   onPressed: () {},
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Text(
          //         'You didn’t receive the code!',
          //         style: TextStyle(color: Colors.black),
          //       ),
          //       SizedBox(
          //         width: 5.w,
          //       ),
          //       Text(
          //         'Resend',
          //         style: AppColors.fredoka.bodyText1!.copyWith(
          //             color: AppColors.mainColor,
          //             decoration: TextDecoration.underline),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
