import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsWidget extends StatelessWidget {
  final String title;
  const PointsWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "•",
          style: TextStyle(fontSize: 30.sp, color: AppColors.mainColor),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Text(
            title,
          ),
        ),
      ],
    );
  }
}
