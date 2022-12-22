import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class LendersCardWidget extends StatelessWidget {
  final String bankName;
  final String bankType;
  final String image;
  const LendersCardWidget({
    Key? key,
    required this.bankName,
    required this.bankType,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF3F0F0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        title: Text(
          bankName,
          style: AppColors.fredoka.bodyLarge,
        ),
        subtitle: Text(
          bankType,
          style: AppColors.fredoka.bodySmall,
        ),
        leading: Image(
          image: NetworkImage(image),
          width: 50.w,
          height: 50.w,
        ),
      ),
    );
  }
}
