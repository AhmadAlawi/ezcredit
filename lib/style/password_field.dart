import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../lang/key_lang.dart';
import '../theme/app_colors.dart';
import 'form_style.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {Key? key,
      required this.passwordController,
      required this.radius,
      required this.hintText,
      this.borderColor,
      this.enableBorderColor,
      this.textColor,
      this.validator})
      : super(key: key);

  final TextEditingController passwordController;
  final double radius;
  final String hintText;
  final Color? borderColor;
  final Color? enableBorderColor;
  final Color? textColor;
  final String? Function(String?)? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: widget.textColor ?? AppColors.white),
      autofocus: false,
      controller: widget.passwordController,
      decoration: AppStyles.formStyle(
        widget.hintText,
        borderColor: widget.borderColor,
        enabledBorderColor: widget.enableBorderColor,
        focusBorderColor: widget.enableBorderColor,
        radius: widget.radius,
        suffixIcon: InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Icon(
            !showPassword ? Icons.visibility_outlined : Icons.visibility_off,
            color: widget.textColor ?? AppColors.white,
            size: 20.sp,
          ),
          onTap: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
        ),
      ),
      obscureText: !showPassword,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return KeyLang.enterValue.tr();
            } else if (value.length < 6) {
              return KeyLang.errorPass.tr();
            }
            return null;
          },
    );
  }
}
