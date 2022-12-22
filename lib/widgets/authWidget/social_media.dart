import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaRectangularButton extends StatelessWidget {
  final String svgIcon;
  final VoidCallback onPressed;
  const SocialMediaRectangularButton({
    Key? key,
    required this.svgIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 50.h,
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xffEDE9D0),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: const Color(0xffEDE9D0)),
        ),
        child: Center(
          child: SvgPicture.asset(
            svgIcon,
          ),
        ),
      ),
    );
  }
}
