import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config.dart';

class ChangingLAng extends ChangeNotifier {
  Locale local = ConfigLanguage.enLocale;

  changeLang(BuildContext context) async {
    if (local == ConfigLanguage.arLocale) {
      await EasyLocalization.of(context)!
          .setLocale(
            ConfigLanguage.enLocale,
          )
          .then((value) => local = ConfigLanguage.enLocale);
    } else {
      await EasyLocalization.of(context)!
          .setLocale(ConfigLanguage.arLocale)
          .then((value) => local = ConfigLanguage.arLocale);
    }
    return null;
  }
}
