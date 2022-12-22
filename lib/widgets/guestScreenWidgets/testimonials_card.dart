import 'package:ezcredit/lang/change_lang.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/assets.dart';
import '../../theme/app_colors.dart';

class TestimonialsCard extends StatelessWidget {
  final String name;
  final String title;
  const TestimonialsCard({Key? key, required this.title, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.backGround,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      height: 170.h,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 15.h, right: 10.w),
                child: SvgPicture.asset(local == ConfigLanguage.arLocale
                    ? SvgAssets.reverseQuotation
                    : SvgAssets.quotation),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Text(
                    title,
                    maxLines: 5,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  name,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: 100.w,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, bottom: 15.h),
                child: SvgPicture.asset(local == ConfigLanguage.arLocale
                    ? SvgAssets.quotation
                    : SvgAssets.reverseQuotation),
              ),
              SizedBox(
                width: 8.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
