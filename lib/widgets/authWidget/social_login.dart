import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style/assets.dart';
import 'social_media.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (Platform.isIOS) SizedBox(width: 25.w),
        if (Platform.isIOS)
          SocialMediaRectangularButton(
            onPressed: () async {},
            svgIcon: SvgAssets.apple,
          ),
        SizedBox(width: 16.w),
        SocialMediaRectangularButton(
          onPressed: () async {},
          svgIcon: SvgAssets.google,
        ),
      ],
    );
  }
}
