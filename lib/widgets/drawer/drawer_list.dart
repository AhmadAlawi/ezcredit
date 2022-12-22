import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerList extends StatelessWidget {
  final String title;
  final String icon;
  final Color? color;
  final void Function() onTap;
  const DrawerList(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        icon,
      ),
      title: Text(
        title,
        style: AppColors.fredoka.subtitle1!
            .copyWith(color: color ?? AppColors.mainColor),
      ),
    );
  }
}
