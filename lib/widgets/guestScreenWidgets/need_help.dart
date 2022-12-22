import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/screen/contact_us_screen.dart';
import 'package:ezcredit/style/assets.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeedHelp extends StatelessWidget {
  const NeedHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.formHintTextColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0.r),
            topLeft: Radius.circular(15.0.r)),
      ),
      width: double.infinity,
      height: 375.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Text(
              '${KeyLang.needHelp.tr().toUpperCase()}?',
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              KeyLang.anyQuestion.tr(),
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            MainButton(
              width: double.infinity,
              radius: 8.r,
              text: KeyLang.askAnything.tr(),
              onPressed: () {
                Navigator.pushNamed(context, ContactUsScreen.id);
              },
              color: AppColors.buttonColor,
              textStyle: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            Image(
              image: const AssetImage(ImageAssets.footer),
              width: double.infinity,
              height: 190.h,
            )
          ],
        ),
      ),
    );
  }
}
