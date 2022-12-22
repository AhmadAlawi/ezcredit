import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../lang/key_lang.dart';
import '../../style/assets.dart';
import '../../theme/app_colors.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(KeyLang.contactUs.tr(), style: AppColors.fredoka.headline5),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(SvgAssets.phone),
              SizedBox(
                width: 14.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    KeyLang.phoneNumber.tr(),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text('0096512345678', style: AppColors.fredoka.subtitle2),
                ],
              ),
            ],
          ),
          Divider(
            color: const Color(0xFFE7E7E7),
            thickness: 1.w,
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(SvgAssets.email),
              SizedBox(
                width: 14.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    KeyLang.email.tr(),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text('info@ezcredit.com', style: AppColors.fredoka.subtitle2),
                ],
              ),
            ],
          ),
          Divider(
            color: const Color(0xFFE7E7E7),
            thickness: 1.w,
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
