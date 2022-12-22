import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/widgets/generalWidgets/points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../lang/key_lang.dart';
import '../../style/assets.dart';
import '../../theme/app_colors.dart';
import 'guest_bottom_sheet.dart';

class CreditServicesWidget extends StatelessWidget {
  static const String id = 'GuestCreditServicesScreen';

  const CreditServicesWidget({
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
                  KeyLang.creditServices.tr(),
                  style: AppColors.fredoka.headline5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.creditDesc.tr(),
                  style: AppColors.fredoka.headline6!
                      .copyWith(color: AppColors.buttonColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.creditTitle1.tr(),
                  style: AppColors.fredoka.subtitle2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.creditTitle2.tr(),
                  style: AppColors.fredoka.bodyText2!
                      .copyWith(color: const Color(0xff333333)),
                ),
              ),
              PointsWidget(
                text: KeyLang.creditPoints1.tr(),
              ),
              PointsWidget(
                text: KeyLang.creditPoints2.tr(),
              ),
              PointsWidget(text: KeyLang.creditPoints3.tr()),
              PointsWidget(text: KeyLang.creditPoints4.tr()),
              PointsWidget(text: KeyLang.creditPoints5.tr()),
              PointsWidget(text: KeyLang.creditPoints6.tr()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Text(
                  KeyLang.creditEnds.tr(),
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
