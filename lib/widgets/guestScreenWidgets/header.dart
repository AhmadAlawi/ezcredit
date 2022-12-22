import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/screen/sign_up_screen.dart';
import 'package:ezcredit/style/assets.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/header_slider.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/loan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

import 'credit_widget.dart';

class HeaderGuest extends StatelessWidget {
  const HeaderGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> headerSlider = [
      {
        "title1": "EZ ",
        "title2": "CREDIT...",
        "description": KeyLang.bankingServices.tr(),
        "buttonText": KeyLang.registerNow.tr(),
        "backgroundImage": ImageAssets.gueastHeader,
        "onPress": () {
          Navigator.pushNamed(context, SignUpScreen.id);
        }
      },
      {
        "title2": KeyLang.needLoan.tr(),
        "title1": "",
        "description": KeyLang.hederSliderLoanDesc.tr(),
        "buttonText": KeyLang.hederSliderLoanButton.tr(),
        "backgroundImage": ImageAssets.loanHeader,
        "onPress": () {
          Navigator.pushNamed(context, LoanServicesWidget.id,
              arguments: {'title': KeyLang.leons.tr()});
        }
      },
      {
        "title2": KeyLang.hederSliderCredit.tr(),
        "title1": "",
        "description": KeyLang.hederSliderCreditDesc.tr(),
        "buttonText": KeyLang.hederSliderCreditButton.tr(),
        "backgroundImage": ImageAssets.creditCardHeader,
        "onPress": () {
          Navigator.pushNamed(context, CreditServicesWidget.id,
              arguments: {'title': KeyLang.creditCard.tr()});
        }
      },
      {
        "title2": KeyLang.hederSliderBest.tr(),
        "title1": "",
        "description": KeyLang.hederSliderBestDesc.tr(),
        "buttonText": KeyLang.hederSliderBestButton.tr(),
        "backgroundImage": ImageAssets.depositHeader,
        "onPress": () {
          Navigator.pushNamed(context, CreditServicesWidget.id,
              arguments: {'title': KeyLang.deposits.tr()});
        }
      },
    ];

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 272.h,
            child: CarouselSlider.builder(
              enableAutoSlider: true,
              unlimitedMode: true,
              initialPage: 0,
              autoSliderTransitionTime: const Duration(milliseconds: 500),
              slideTransform: const DefaultTransform(),
              slideIndicator: CircularSlideIndicator(
                  // indicatorBorderWidth: 2.w,
                  indicatorRadius: 5.r,
                  itemSpacing: 12.w,
                  padding: const EdgeInsets.all(6),
                  currentIndicatorColor: AppColors.white,
                  indicatorBackgroundColor: AppColors.iconColor,
                  alignment: Alignment.bottomCenter),
              itemCount: headerSlider.length,
              slideBuilder: (index) {
                return HeaderSLider(
                    title1: headerSlider[index]['title1'],
                    title2: headerSlider[index]['title2'],
                    description: headerSlider[index]['description'],
                    buttonText: headerSlider[index]['buttonText'],
                    onPressed: headerSlider[index]['onPress'],
                    backgroundImage: headerSlider[index]['backgroundImage']);
              },
            ),
          ),
        ]);
  }
}
