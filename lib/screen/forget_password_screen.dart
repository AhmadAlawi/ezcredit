import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/forget_pass_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/screen/login_screen.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../style/assets.dart';
import '../style/form_style.dart';

class ForgetPasswordScreens extends StatefulWidget {
  static const String id = 'ForgetPassword';

  const ForgetPasswordScreens({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreens> createState() => _ForgetPasswordScreensState();
}

class _ForgetPasswordScreensState extends State<ForgetPasswordScreens> {
  final TextEditingController phoneController = TextEditingController();

  RegExp email = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

  String? isEmailValid(String? value) {
    if (value?.isEmpty ?? true) {
      return KeyLang.enterValue.tr();
    } else if (!email.hasMatch(value!.toLowerCase())) {
      return 'enter valid Email';
    }
    return null;
  }

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool checkEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
        leadingWidth: 200.w,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, LoginScreen.id);
          },
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios),
              Text(KeyLang.login.tr())
            ],
          ),
        ),
        title: SvgPicture.asset(
          SvgAssets.logo,
          width: 25,
          height: 40,
        ),
      ),
      body: checkEmail == false
          ? SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              child: Form(
                key: formKey,
                autovalidateMode: autoValidate,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(KeyLang.forgetPassword.tr(),
                          style: AppColors.fredoka.headline5),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(KeyLang.enterYourEmail.tr(),
                          style: AppColors.fredoka.bodyLarge),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: AppColors.mainColor),
                          controller: phoneController,
                          validator: (value) => isEmailValid(value),
                          decoration: AppStyles.formStyle(KeyLang.email.tr(),
                              radius: 4.r,
                              borderColor: AppColors.formBorderColor,
                              enabledBorderColor: AppColors.formBorderColor)),
                      SizedBox(
                        height: 40.h,
                      ),
                      Consumer<ForgetPassController>(
                          builder: (context, fogetPassController, child) {
                        return MainButton(
                          text: KeyLang.next.tr(),
                          isDisabled: fogetPassController.isLoading,
                          onPressed: () async {
                            Map<String, dynamic>? forgetPassMap = {};

                            if (formKey.currentState!.validate()) {
                              forgetPassMap =
                                  await fogetPassController.forgetpassHandler(
                                      email: phoneController.text,
                                      context: context);
                              if (forgetPassMap?['result'] == true) {
                                if (!mounted) return;
                                checkEmail = true;
                                setState(() {});
                              }
                            }
                          },
                          radius: 10.r,
                          width: double.infinity,
                          color: AppColors.buttonColor,
                        );
                      })
                    ]),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  Text(
                    'We have sent link to your email to change your password',
                    style: AppColors.fredoka.headline6,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  MainButton(
                      text: 'Back to Login',
                      width: double.infinity,
                      radius: 10.r,
                      color: AppColors.buttonColor,
                      onPressed: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName(LoginScreen.id));
                      })
                ],
              ),
            ),
    );
  }
}
