import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'config.dart';

Locale local = ConfigLanguage.enLocale;
Color colorEN = Colors.transparent;
Color colorAr = Colors.transparent;

changeLang(BuildContext context) {
  if (local == ConfigLanguage.arLocale) {
    context.setLocale(ConfigLanguage.enLocale);

    local = ConfigLanguage.enLocale;
    colorEN = AppColors.buttonColor;

    colorAr = Colors.transparent;
  } else {
    context.setLocale(ConfigLanguage.arLocale);

    local = ConfigLanguage.arLocale;
    colorAr = AppColors.buttonColor;
    colorEN = Colors.transparent;
  }
  return local;
}
