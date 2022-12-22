import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../lang/key_lang.dart';
import '../style/assets.dart';
import '../widgets/authWidget/otp_form.dart';
import 'login_screen.dart';

class OtpScreen extends StatefulWidget {
  static const String id = 'OtpScreen';
  final String? email;
  final String? password;

  const OtpScreen({Key? key, this.email, this.password}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(KeyLang.verificationCode.tr(),
                    style: AppColors.fredoka.headline5),
                SizedBox(
                  height: 15.h,
                ),
                Text(KeyLang.enterVerificationCode.tr(),
                    style: AppColors.fredoka.bodyLarge),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  KeyLang.sentVerificationCode.tr(),
                  style: TextStyle(fontSize: 14.sp, color: AppColors.mainColor),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OtpForm(
                email: widget.email,
                password: widget.password,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
