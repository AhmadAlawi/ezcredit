import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';

class OneEzCredit extends StatelessWidget {
  final String title;
  final Widget icon;
  const OneEzCredit({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.r),
        ),
        gradient: LinearGradient(
          colors: AppColors.borderButton,
        ),
      ),
      child: Center(
        child: Container(
            alignment: Alignment.center,
            color: AppColors.lightBackgroundColor,
            margin: EdgeInsets.all(2.w),
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(
                  height: 8.h,
                ),
                Text(title,
                    textAlign: TextAlign.center,
                    style: AppColors.fredoka.subtitle2),
              ],
            )),
      ),
    );
  }
}
