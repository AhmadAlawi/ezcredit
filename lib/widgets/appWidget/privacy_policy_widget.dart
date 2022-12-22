import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../lang/change_lang.dart';
import '../../lang/key_lang.dart';
import '../../theme/app_colors.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(KeyLang.privacyPolicy.tr(), style: AppColors.fredoka.headline5),
          SizedBox(
            height: 16.h,
          ),
          Text(KeyLang.privacyText1.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText2.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText3.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText4.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText5.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText6.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText7.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText8.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText9.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText10.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText11.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.privacyText12.tr()),
          SizedBox(
            height: 20.h,
          ),
          local == ConfigLanguage.enLocale
              ? SizedBox(
                  height: 70.h,
                )
              : Column(
                  children: [
                    const Text(
                        'مراقبة الموقع: هذا الموقع والتطبيق خاضعان لرقابة شركة إبتكار للحلول الذكية بشكل مستمر لغاية السلامة والأمان، وباستخدامك لهذا الموقع فإنك توافق ضمنا على هذه المراقبة. ويُحظر على المستخدمين محاولة تحريف أو تغيير المعلومات المعروضة على هذا الموقع من دون تصريح أو صلاحية للتغيير، كما يحظر عليهم محاولة التخطّي أو التحايل على هذه الإجراءات الأمنية، أو استخدام هذا الموقع أو التطبيق لأهداف غير الأهداف المقصودة أصلاً من وجوده. وأي دليل على مثل هذه المحاولات سوف يمنح إبتكار و"إيزي كريدت" كامل الحق في إحالة المستبب بها إلى الجهات الأمنية واتخاذ الإجراءات القانونية المناسية.'),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                        'القانون الواجب التطبيق: تخضع هذه الشروط والأحكام لقوانين دولة الكويت وأحكام الشريعة الاسلامية الغراء.'),
                    SizedBox(
                      height: 70.h,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
