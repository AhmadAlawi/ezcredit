import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/widgets/generalWidgets/points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../lang/key_lang.dart';
import '../../style/assets.dart';
import '../../theme/app_colors.dart';
import 'guest_bottom_sheet.dart';

class LoanServicesWidget extends StatelessWidget {
  static const String id = 'GuestLoanServicesScreen';

  const LoanServicesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          elevation: 0,
          leadingWidth: 100.w,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                Text(
                  KeyLang.home.tr(),
                  style: AppColors.fredoka.bodySmall!
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: const GuestBottomsheet(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage(ImageAssets.carLoan),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.loanServices.tr(),
                  style: AppColors.fredoka.headline5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.loanDesc.tr(),
                  style: AppColors.fredoka.headline6!
                      .copyWith(color: AppColors.buttonColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.loanTitle1.tr(),
                  style: AppColors.fredoka.subtitle2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.loanTitle2.tr(),
                  style: AppColors.fredoka.subtitle2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.loanTypes.tr(),
                  style: AppColors.fredoka.bodyText2!
                      .copyWith(color: const Color(0xff333333)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    PointsWidget(
                      text: KeyLang.autoLoan.tr(),
                    ),
                    PointsWidget(
                      text: KeyLang.housingLoan.tr(),
                    ),
                    PointsWidget(text: KeyLang.personalLoan.tr()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.ezCreditLoanService.tr(),
                  style: AppColors.fredoka.bodyText2!
                      .copyWith(color: const Color(0xff333333)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    PointsWidget(text: KeyLang.whyLoan1.tr()),
                    PointsWidget(text: KeyLang.whyLoan2.tr()),
                    PointsWidget(text: KeyLang.whyLoan3.tr()),
                    PointsWidget(text: KeyLang.whyLoan4.tr()),
                    PointsWidget(text: KeyLang.whyLoan5.tr()),
                    PointsWidget(text: KeyLang.whyLoan6.tr()),
                    PointsWidget(text: KeyLang.whyLoan7.tr()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.loanEnd1.tr(),
                  style: AppColors.fredoka.subtitle2!
                      .copyWith(color: const Color(0xff333333)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.loanEnd2.tr(),
                  style: AppColors.fredoka.subtitle2!
                      .copyWith(color: const Color(0xff333333)),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ));
  }
}
