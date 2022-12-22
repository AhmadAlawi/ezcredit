import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/lang/change_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../lang/key_lang.dart';
import '../../theme/app_colors.dart';

class LanguageWidget extends StatefulWidget {
  static const String id = 'LanguageScreen';

  const LanguageWidget({Key? key}) : super(key: key);

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        leadingWidth: 150.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                Text(
                  KeyLang.settings.tr(),
                  style: TextStyle(color: AppColors.white, fontSize: 18.sp),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(KeyLang.language.tr(), style: AppColors.fredoka.headline5),
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              onTap: () {
                changeLang(context);
              },
              title: Text(KeyLang.arabicLang.tr(),
                  style: AppColors.fredoka.subtitle1),
              trailing: Icon(
                Icons.check,
                color: colorAr,
              ),
            ),
            Divider(
              color: AppColors.dividerColor,
              thickness: 1.5.w,
              height: 40.h,
            ),
            ListTile(
              onTap: () {
                changeLang(context);
              },
              title: Text(KeyLang.english.tr(),
                  style: AppColors.fredoka.subtitle1),
              trailing: Icon(
                Icons.check,
                color: colorEN,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
