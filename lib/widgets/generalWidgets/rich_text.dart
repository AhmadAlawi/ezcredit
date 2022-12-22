import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RichTextAuth extends StatelessWidget {
  const RichTextAuth(
      {Key? key,
      required String fword,
      required String sword,
      String? thword,
      String? foword,
      TextDecoration? textDecoration,
      Color? color,
      required Function() onTap,
      Function()? onTap2})
      : _fword = fword,
        _sword = sword,
        _onTap = onTap,
        _onTap2 = onTap2,
        _thword = thword,
        _foword = foword,
        _color = color,
        _textDecoration = textDecoration,
        super(key: key);

  final String _fword;
  final String _sword;
  final String? _thword;
  final String? _foword;
  final TextDecoration? _textDecoration;
  final Color? _color;

  final Function() _onTap;
  final Function()? _onTap2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _fword.tr(),
            style: TextStyle(color: AppColors.white, fontSize: 17.sp),
          ),
          TextSpan(
            text: _sword.tr(),
            style: AppColors.fredoka.subtitle1!.copyWith(
              color: _color ?? AppColors.white,
              decoration: _textDecoration,
            ),
            recognizer: TapGestureRecognizer()..onTap = _onTap,
          ),
          TextSpan(
            text: _thword?.tr() ?? "",
            style: TextStyle(color: AppColors.white, fontSize: 17.sp),
          ),
          TextSpan(
            text: _foword?.tr() ?? "",
            style: AppColors.fredoka.subtitle1!.copyWith(
              color: _color ?? AppColors.white,
            ),
            recognizer: TapGestureRecognizer()..onTap = _onTap2,
          )
        ],
      ),
    );
  }
}
