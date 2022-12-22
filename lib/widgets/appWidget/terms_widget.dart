import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/lang/change_lang.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:ezcredit/widgets/appWidget/content.dart';
import 'package:ezcredit/widgets/appWidget/points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../lang/key_lang.dart';
import '../../theme/app_colors.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(KeyLang.termsAndCondition.tr(),
              style: AppColors.fredoka.headline5),
          SizedBox(
            height: 16.h,
          ),
          ContentWidget(
              title: KeyLang.definitions.tr(),
              description: KeyLang.definitionsDesc.tr()),
          Text(KeyLang.eligibility.tr(), style: AppColors.fredoka.subtitle1),
          SizedBox(
            height: 12.h,
          ),
          PointsWidget(title: KeyLang.eligibilityDesc1.tr()),
          PointsWidget(title: KeyLang.eligibilityDesc2.tr()),
          PointsWidget(title: KeyLang.eligibilityDesc3.tr()),
          PointsWidget(title: KeyLang.eligibilityDesc4.tr()),
          PointsWidget(title: KeyLang.eligibilityDesc5.tr()),
          PointsWidget(title: KeyLang.eligibilityDesc6.tr()),
          local == ConfigLanguage.arLocale
              ? const SizedBox()
              : PointsWidget(title: KeyLang.eligibilityDesc7.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.responsibility.tr(), style: AppColors.fredoka.subtitle1),
          SizedBox(
            height: 12.h,
          ),
          PointsWidget(title: KeyLang.responsibilityDesc1.tr()),
          PointsWidget(title: KeyLang.responsibilityDesc2.tr()),
          PointsWidget(title: KeyLang.responsibilityDesc3.tr()),
          PointsWidget(title: KeyLang.responsibilityDesc4.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.confidentiality.tr(),
              style: AppColors.fredoka.subtitle1),
          SizedBox(
            height: 12.h,
          ),
          PointsWidget(title: KeyLang.confidentialityDesc1.tr()),
          PointsWidget(title: KeyLang.confidentialityDesc2.tr()),
          PointsWidget(title: KeyLang.confidentialityDesc3.tr()),
          PointsWidget(title: KeyLang.confidentialityDesc4.tr()),
          SizedBox(
            height: 20.h,
          ),
          ContentWidget(
              title: KeyLang.consentForm.tr(),
              description: KeyLang.consentFormDesc.tr()),
          ContentWidget(
              title: KeyLang.creditReport.tr(),
              description: KeyLang.creditReportDesc.tr()),
          Text(KeyLang.dataPolicy.tr(), style: AppColors.fredoka.subtitle1),
          SizedBox(
            height: 12.h,
          ),
          PointsWidget(title: KeyLang.dataPolicyDesc1.tr()),
          PointsWidget(title: KeyLang.dataPolicyDesc2.tr()),
          PointsWidget(title: KeyLang.dataPolicyDesc3.tr()),
          PointsWidget(title: KeyLang.dataPolicyDesc4.tr()),
          PointsWidget(title: KeyLang.dataPolicyDesc5.tr()),
          SizedBox(
            height: 20.h,
          ),
          Text(KeyLang.disclaimers.tr(), style: AppColors.fredoka.subtitle1),
          SizedBox(
            height: 12.h,
          ),
          PointsWidget(title: KeyLang.disclaimersDesc1.tr()),
          PointsWidget(title: KeyLang.disclaimersDesc2.tr()),
          PointsWidget(title: KeyLang.disclaimersDesc3.tr()),
          SizedBox(
            height: 20.h,
          ),
          ContentWidget(
              title: KeyLang.governingLaw.tr(),
              description: KeyLang.governingLawDesc.tr()),
          ContentWidget(
              title: KeyLang.marketingCommunications.tr(),
              description: KeyLang.marketingCommunicationsDesc.tr()),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
