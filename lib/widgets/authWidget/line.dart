import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class LineWidget extends StatelessWidget {
  final String title;
  const LineWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.white,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text(
            title,
            style: AppColors.fredoka.subtitle1!.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.white,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
