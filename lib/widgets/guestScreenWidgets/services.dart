import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/app_colors.dart';

class ServicesList extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final Function() onTap;
  const ServicesList(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
            border: Border.all(width: 1.w, color: AppColors.borderColor)),
        width: double.infinity,
        height: 100.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                    border:
                        Border.all(width: 1.w, color: AppColors.borderColor)),
                height: 100.h,
                width: 100.w,
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    width: 57.w,
                    height: 59.h,
                  ),
                )),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(color: AppColors.titleColor, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    subTitle,
                    style:
                        TextStyle(color: AppColors.mainColor, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: onTap, icon: const Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
