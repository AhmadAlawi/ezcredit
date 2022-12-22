import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';

class UserNavigationList extends StatelessWidget {
  final String title;
  final String icon;
  final void Function() onTap;
  const UserNavigationList(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            height: 50.h,
            child: Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(
                  width: 14.w,
                ),
                Text(
                  title,
                  style: AppColors.fredoka.subtitle1!
                      .copyWith(color: AppColors.mainColor),
                )
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: const Color(0xFFE7E7E7),
          height: 14.h,
        ),
      ],
    );
  }
}
