import 'package:ezcredit/lang/change_lang.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final String text;
  final bool isBordered;
  final bool isGradiunt;
  final VoidCallback onPressed;
  final Widget? icon;
  final double radius;
  final Color? color;
  final List<Color>? gradiuntColors;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final bool isDisabled;

  const MainButton({
    Key? key,
    this.isBordered = false,
    required this.text,
    required this.onPressed,
    this.radius = 3,
    this.color,
    this.icon,
    this.isGradiunt = false,
    this.textStyle,
    this.gradiuntColors,
    this.width = 160,
    this.height = 40,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: Container(
        height: height ?? 40.h,
        width: width ?? 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          border: isBordered
              ? Border.all(color: color ?? appColor.primary)
              : isDisabled
                  ? Border.all(color: Colors.grey)
                  : null,
          gradient: !isBordered && isGradiunt && !isDisabled
              ? LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: gradiuntColors ??
                      [appColor.primary, appColor.primary.withOpacity(0.5)],
                )
              : null,
          color: isBordered
              ? Colors.transparent
              : isDisabled
                  ? Colors.grey.withOpacity(0.4)
                  : color ?? appColor.primary,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
          child: local == ConfigLanguage.enLocale
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: textStyle ??
                          Theme.of(context).textTheme.button!.copyWith(
                                color: isBordered
                                    ? color ?? appColor.primary
                                    : Colors.white,
                              ),
                    ),
                  ],
                )
              : FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        Theme.of(context).textTheme.button!.copyWith(
                              color: isBordered
                                  ? color ?? appColor.primary
                                  : Colors.white,
                            ),
                  ),
                ),
        ),
      ),
    );
  }
}
