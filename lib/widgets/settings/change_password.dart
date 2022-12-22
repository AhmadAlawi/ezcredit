import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/forget_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../lang/key_lang.dart';
import '../../style/password_field.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/main_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String id = 'ChangePasswordScreen';

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        leadingWidth: 150.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                Text(
                  KeyLang.settings.tr(),
                  style: TextStyle(color: AppColors.white, fontSize: 18.sp),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(KeyLang.changePassword.tr(),
                    style: AppColors.fredoka.headline5),
                SizedBox(
                  height: 15.h,
                ),
                PasswordField(
                  passwordController: currentPasswordController,
                  borderColor: AppColors.formBorderColor,
                  enableBorderColor: AppColors.formBorderColor,
                  textColor: AppColors.mainColor,
                  radius: 4.r,
                  hintText: KeyLang.currentPass.tr(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                PasswordField(
                  passwordController: passwordController,
                  borderColor: AppColors.formBorderColor,
                  enableBorderColor: AppColors.formBorderColor,
                  textColor: AppColors.mainColor,
                  radius: 4.r,
                  hintText: KeyLang.newPass.tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return KeyLang.enterValue.tr();
                    } else if (value.length < 6) {
                      return KeyLang.errorPass.tr();
                    } else if (passwordController.text ==
                        currentPasswordController.text) {
                      return KeyLang.passwordALreadyUsed.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                PasswordField(
                  borderColor: AppColors.formBorderColor,
                  enableBorderColor: AppColors.formBorderColor,
                  passwordController: confirmPasswordController,
                  radius: 4.r,
                  textColor: AppColors.mainColor,
                  hintText: KeyLang.rePass.tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return KeyLang.enterValue.tr();
                    } else if (value.length < 6) {
                      return KeyLang.errorPass.tr();
                    } else if (confirmPasswordController.text !=
                        passwordController.text) {
                      return KeyLang.passwordDoesNotMatch.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                Consumer<ForgetPassController>(
                    builder: (context, passController, child) {
                  return MainButton(
                    text: KeyLang.save.tr(),
                    isDisabled: passController.isLoading,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await passController.changepassHandler(
                            newPass: passwordController.text,
                            currentPass: currentPasswordController.text,
                            context: context);
                      } else {
                        autoValidate = AutovalidateMode.onUserInteraction;
                        setState(() {});
                      }
                    },
                    width: double.infinity,
                    color: AppColors.buttonColor,
                    radius: 10.r,
                  );
                })
              ],
            ),
          )),
    );
  }
}
