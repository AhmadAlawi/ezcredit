import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class ContentWidget extends StatelessWidget {
  final String title;
  final String description;

  const ContentWidget(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppColors.fredoka.subtitle1),
        SizedBox(
          height: 12.h,
        ),
        Text(description),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
