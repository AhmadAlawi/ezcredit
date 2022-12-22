import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../lang/key_lang.dart';
import '../../theme/app_colors.dart';

class EmailWidget extends StatelessWidget {
  static const String id = 'EmailScreen';
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
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
            Text(KeyLang.emailAddress.tr(), style: AppColors.fredoka.headline5),
            SizedBox(
              height: 20.h,
            ),
            Text(KeyLang.primaryEmail.tr()),
            SizedBox(
              height: 8.h,
            ),
            Text(
              arguments['email'],
            ),
          ],
        ),
      ),
    );
  }
}
