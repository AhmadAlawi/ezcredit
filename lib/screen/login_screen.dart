// ignore_for_file: use_build_context_synchronously
import 'package:ezcredit/controller/auth_controller.dart';
import 'package:ezcredit/screen/forget_password_screen.dart';
import 'package:ezcredit/screen/sign_up_screen.dart';
import 'package:ezcredit/widgets/authWidget/line.dart';
import 'package:ezcredit/widgets/authWidget/social_login.dart';
import 'package:ezcredit/widgets/generalWidgets/logo.dart';
import 'package:ezcredit/widgets/generalWidgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../lang/key_lang.dart';
import '../style/assets.dart';
import '../style/form_style.dart';
import '../style/password_field.dart';
import '../theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/generalWidgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.background), fit: BoxFit.fill)),
        child: Column(
          children: [
            const LogoWidget(
              hight: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Form(
                    key: formKey,
                    autovalidateMode: autoValidate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(KeyLang.login.tr().toUpperCase(),
                            style: AppColors.fredoka.headline5!
                                .copyWith(color: AppColors.white)),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style:
                                TextStyle(color: AppColors.formHintTextColor),
                            controller: phoneController,
                            validator: (value) => isEmailValid(value),
                            decoration: AppStyles.formStyle(KeyLang.email.tr(),
                                radius: 4.r,
                                borderColor: AppColors.white,
                                enabledBorderColor: AppColors.white)),
                        SizedBox(
                          height: 10.h,
                        ),
                        PasswordField(
                          passwordController: passwordController,
                          radius: 4.r,
                          hintText: KeyLang.password.tr(),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ForgetPasswordScreens.id);
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(KeyLang.forgetPassword.tr(),
                                  textAlign: TextAlign.end,
                                  style: AppColors.fredoka.bodyText2!.copyWith(
                                      color: AppColors.white,
                                      decoration: TextDecoration.underline)),
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                        Consumer<Authcontroller>(
                            builder: (context, authController, child) {
                          return MainButton(
                            text: KeyLang.loginToYourAccount.tr(),
                            isDisabled: authController.isLoading,
                            onPressed: () async {
                              autoValidate = AutovalidateMode.onUserInteraction;
                              setState(() {});
                              if (formKey.currentState!.validate()) {
                                await authController.loginHandler(
                                    email: phoneController.text,
                                    password: passwordController.text,
                                    context: context);
                              }
                              authController.setIsloading = false;
                            },
                            textStyle: AppColors.fredoka.headline6,
                            width: double.infinity,
                            radius: 8.r,
                            color: AppColors.formHintTextColor,
                          );
                        }),
                        SizedBox(
                          height: 30.h,
                        ),
                        LineWidget(title: KeyLang.loginInWith.tr()),
                        SizedBox(
                          height: 20.h,
                        ),
                        const SocialLogin(),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextButtonWidget(
                            firstText: KeyLang.newToEZCREDIT.tr(),
                            secondText: KeyLang.signUp.tr(),
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, SignUpScreen.id);
                            }),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
