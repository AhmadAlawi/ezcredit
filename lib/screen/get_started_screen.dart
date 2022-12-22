import 'package:ezcredit/globals.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/screen/guest_screen.dart';
import 'package:ezcredit/screen/sign_up_screen.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/generalWidgets/logo.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:ezcredit/widgets/generalWidgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../style/assets.dart';

class GetStartedScreen extends StatelessWidget {
  static const String id = 'GetStartedScreen';

  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.background), fit: BoxFit.fill)),
      child: Column(
        children: [
          const LogoWidget(
            hight: 80,
          ),
          Text(
            KeyLang.letsGetStarted.tr(),
            style:
                AppColors.fredoka.headline5!.copyWith(color: AppColors.white),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            KeyLang.oneApp.tr(),
            style: TextStyle(color: AppColors.white, fontSize: 17.sp),
          ),
          Text(
            KeyLang.multipleLenders.tr(),
            style: TextStyle(color: AppColors.white, fontSize: 17.sp),
          ),
          SizedBox(
            height: 120.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: MainButton(
              textStyle: AppColors.fredoka.headline6,
              width: double.infinity,
              text: KeyLang.createAccount.tr(),
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
              radius: 8.r,
              color: AppColors.formHintTextColor,
            ),
          ),
          TextButtonWidget(
              firstText: "",
              secondText: KeyLang.joinAsGueast.tr(),
              onTap: () {
                user = 'guest';
                Navigator.pushNamed(context, GuestScreen.id);
              }),
        ],
      ),
    ));
  }
}
