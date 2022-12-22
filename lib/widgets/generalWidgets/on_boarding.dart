import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';

class OnBoardingWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const OnBoardingWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: SvgPicture.asset(
          icon,
          width: double.infinity,
          height: 210.h,
        )),
        SizedBox(
          height: 30.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: AppColors.fredoka.headline5!
                    .copyWith(color: AppColors.white),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              description,
              style:
                  AppColors.fredoka.subtitle1!.copyWith(color: AppColors.white),
            ),
          ],
        )
      ],
    );
  }
}
