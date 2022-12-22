import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';

class ProposalCardWidget extends StatelessWidget {
  final String bankName;
  final String time;
  final String image;
  final String? status;
  final void Function() onTap;
  const ProposalCardWidget(
      {Key? key,
      required this.bankName,
      required this.time,
      required this.onTap,
      required this.image,
      this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF3F0F0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bankName,
              style: AppColors.fredoka.bodyLarge,
            ),
            Text(
              '$status',
              style: AppColors.fredoka.bodyLarge!.copyWith(
                  color: status == 'pending'
                      ? const Color(0xff9E9E9E)
                      : status == 'accepted'
                          ? const Color(0xff3CCD0C)
                          : const Color(0xff9B1F0E)),
            )
          ],
        ),
        subtitle: Text(
          time,
          style: AppColors.fredoka.bodySmall,
        ),
        onTap: onTap,
        leading: Image(
          image: NetworkImage(image),
          width: 50.w,
          height: 50.w,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}
