import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/widgets/generalWidgets/default_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../globals.dart';
import '../lang/key_lang.dart';
import '../theme/app_colors.dart';

class OffersScreen extends StatelessWidget {
  static const String id = 'OffersScreen';

  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user == 'guest'
        ? EZDefaultScaffold(
            body: Text(KeyLang.offers.tr()),
            title: Text(
              KeyLang.offers.tr().toUpperCase(),
              style: TextStyle(color: AppColors.white, fontSize: 18.sp),
            ),
          )
        : Text(KeyLang.offers.tr());
  }
}
