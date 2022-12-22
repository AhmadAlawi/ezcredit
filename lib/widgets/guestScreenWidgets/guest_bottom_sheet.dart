import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/lang/key_lang.dart';

import '../../screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';

class GuestBottomsheet extends StatelessWidget {
  const GuestBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SignUpScreen.id);
      },
      child: Container(
        width: double.infinity,
        height: 70.h,
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            )),
        child: Center(
          child: Text(
            KeyLang.signUpToezCredit.tr(),
            style:
                AppColors.fredoka.headline6!.copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
