import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';

class CardMenu extends StatelessWidget {
  final String title;
  final String icon;
  final Function()? onTap;
  const CardMenu(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(
              width: 22.w,
            ),
            Text(
              title,
              style: AppColors.fredoka.subtitle1,
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: AppColors.mainColor,
        ),
        onTap: onTap);
  }
}
