// ignore_for_file: use_build_context_synchronously

import 'package:ezcredit/controller/auth_controller.dart';
import 'package:ezcredit/globals.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/screen/login_screen.dart';
import 'package:ezcredit/screen/privacy_policy_screen.dart';
import 'package:ezcredit/screen/term_condition_screen.dart';
import 'package:ezcredit/style/password_field.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/generalWidgets/logo.dart';
import 'package:ezcredit/widgets/generalWidgets/rich_text.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:ezcredit/widgets/generalWidgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../style/assets.dart';
import '../style/form_style.dart';
import '../widgets/authWidget/line.dart';
import '../widgets/authWidget/social_login.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Form(
                    key: formKey,
                    autovalidateMode: autoValidate,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(KeyLang.signUp.tr().toUpperCase(),
                            style: AppColors.fredoka.headline5!.copyWith(
                              color: AppColors.white,
                            )),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextFormField(
                          autofocus: false,
                          style: TextStyle(color: AppColors.formHintTextColor),
                          controller: emailController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => isEmailValid(value),
                          decoration: AppStyles.formStyle(KeyLang.email.tr(),
                              radius: 4.r,
                              borderColor: AppColors.white,
                              enabledBorderColor: AppColors.white),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        PasswordField(
                          passwordController: passwordController,
                          radius: 4.r,
                          hintText: KeyLang.password.tr(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RichTextAuth(
                          fword: KeyLang.buSigning,
                          sword: KeyLang.termsAndCondition,
                          onTap: () {
                            termsSignup = true;
                            Navigator.pushNamed(
                                context, TermsAndConditionScreen.id);
                          },
                          thword: KeyLang.and,
                          foword: KeyLang.privacyPolicy,
                          onTap2: () {
                            termsSignup = true;

                            Navigator.pushNamed(
                                context, PrivacyPolicyScreen.id);
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Consumer<Authcontroller>(
                            builder: (context, authController, child) {
                          return MainButton(
                            text: KeyLang.createAccount.tr(),
                            isDisabled: authController.isLoading,
                            onPressed: () async {
                              autoValidate = AutovalidateMode.onUserInteraction;
                              setState(() {});
                              if (formKey.currentState!.validate()) {
                                await authController.signupHandler(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context);
                              }
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
                        LineWidget(title: KeyLang.signUpWith.tr()),
                        SizedBox(
                          height: 20.h,
                        ),
                        const SocialLogin(),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextButtonWidget(
                          firstText: KeyLang.alreadyMember.tr(),
                          secondText: KeyLang.login.tr(),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.id);
                          },
                        ),
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
