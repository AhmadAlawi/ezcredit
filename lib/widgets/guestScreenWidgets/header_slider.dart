import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/main_button.dart';

class HeaderSLider extends StatelessWidget {
  final String title1;
  final String title2;
  final String description;
  final String buttonText;
  final String backgroundImage;
  final void Function() onPressed;

  const HeaderSLider(
      {Key? key,
      required this.title1,
      required this.title2,
      required this.description,
      required this.buttonText,
      required this.backgroundImage,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0.r),
              bottomRight: Radius.circular(15.0.r)),
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: title1,
                style: AppColors.fredoka.headline5!
                    .copyWith(color: AppColors.primary),
              ),
              TextSpan(
                  text: title2,
                  style: AppColors.fredoka.headline5!
                      .copyWith(color: AppColors.white))
            ]),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(description,
              textAlign: TextAlign.center,
              style: AppColors.fredoka.bodyText1!.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w100)),
          SizedBox(
            height: 24.h,
          ),
          MainButton(
              width: 200.w,
              text: buttonText,
              onPressed: onPressed,
              radius: 8.r,
              color: AppColors.formHintTextColor,
              textStyle: AppColors.fredoka.subtitle1),
        ],
      ),
    );
  }
}
