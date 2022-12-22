import 'package:ezcredit/globals.dart';
import 'package:ezcredit/style/assets.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../generalWidgets/points.dart';

class LoanDetailsWidget extends StatefulWidget {
  final String title;
  const LoanDetailsWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<LoanDetailsWidget> createState() => _LoanDetailsWidgetState();
}

class _LoanDetailsWidgetState extends State<LoanDetailsWidget> {
  @override
  void initState() {
    loanTitle = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          image: AssetImage(ImageAssets.carLoan),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Text(
            widget.title,
            style: AppColors.fredoka.headline5,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            style: AppColors.fredoka.bodyText2!
                .copyWith(color: const Color(0xff333333)),
          ),
        ),
        const PointsWidget(
            text:
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        const PointsWidget(
            text:
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        const PointsWidget(
            text:
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        SizedBox(
          height: 100.h,
        ),
      ],
    );
  }
}
