import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style/assets.dart';

class LogoWidget extends StatelessWidget {
  final double hight;
  const LogoWidget({Key? key, required this.hight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.h, bottom: 5.h),
          child: SvgPicture.asset(SvgAssets.logo),
        ),
        Text(
          "EZCREDIT",
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        SizedBox(
          height: hight.h,
        ),
      ],
    );
  }
}
