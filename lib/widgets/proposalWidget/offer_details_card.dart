import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersDetailsCard extends StatelessWidget {
  final String title;
  final String description;
  const OffersDetailsCard(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text(title),
        SizedBox(
          height: 5.h,
        ),
        Text(description),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
