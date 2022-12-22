import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static InputDecoration formStyle(String hint,
      {Widget? suffixIcon,
      Widget? prefixIcon,
      double? radius,
      Color? filledColor,
      Color? borderColor,
      Color? focusBorderColor,
      Color? errorBorderColor,
      Color? enabledBorderColor}) {
    return InputDecoration(
      // isDense: true,
      // labelStyle: Style.mainFont.subtitle1!.copyWith(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: enabledBorderColor ?? AppColors.white),
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: focusBorderColor ?? AppColors.white),
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 3)),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? AppColors.white),
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 3)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: errorBorderColor ?? AppColors.errorColor, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 3)),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10),
      fillColor: filledColor ?? Colors.transparent,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon == null
          ? null
          : Padding(
              padding:
                  EdgeInsetsDirectional.only(end: 5.w, top: 18.h, start: 8.w),
              child: prefixIcon,
            ),
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[500]),
      hintText: hint,
    );
  }

  static InputDecoration filledField(String hint) {
    return InputDecoration(
      // labelStyle: Style.mainFont.subtitle1!.copyWith(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // errorStyle: Style.mainFont.subtitle2!.copyWith(color: Colors.red),
      fillColor: Colors.white,
      filled: true,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      prefixIcon: const Icon(Icons.search),
      prefixIconColor: AppColors.lightLoading,
    );
  }

  static InputBorder withoutBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
      gapPadding: 0,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    );
  }

  static InputDecoration phonNumber(String hint,
      {Widget? suffix,
      double? radius,
      Color? borderColor,
      Color? focusBorderColor,
      Color? errorBorderColor,
      Color? enabledBorderColor}) {
    return InputDecoration(
      isDense: true,
      // labelStyle: Style.mainFont.subtitle1!.copyWith(),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: enabledBorderColor ?? AppColors.mainColor),
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: focusBorderColor ?? AppColors.mainColor),
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? AppColors.mainColor),
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: errorBorderColor ?? Colors.redAccent, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      ),
      // errorStyle: Style.mainFont.subtitle2!.copyWith(color: Colors.red),
      fillColor: Colors.transparent,
      prefix: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '+965',
            style:
                TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
            child: VerticalDivider(
              color: AppColors.mainColor,
              thickness: 1,
            ),
          ),
        ],
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[500]),
      hintText: hint,
    );
  }
}
