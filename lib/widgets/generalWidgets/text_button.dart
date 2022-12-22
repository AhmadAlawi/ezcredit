import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class TextButtonWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final void Function() onTap;

  const TextButtonWidget(
      {Key? key,
      required this.firstText,
      required this.secondText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firstText,
            style:
                AppColors.fredoka.bodyText1!.copyWith(color: AppColors.white),
          ),
          Text(
            secondText,
            style: AppColors.fredoka.bodyText1!.copyWith(
                color: AppColors.white, decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
