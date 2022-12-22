import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/style/assets.dart';
import 'package:ezcredit/widgets/userHomeWidget/header_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../lang/key_lang.dart';
import '../../theme/app_colors.dart';

class UserHeaderSlider extends StatelessWidget {
  const UserHeaderSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> headerSlider = [
      {
        "title1": KeyLang.needLoan.tr(),
        "description": KeyLang.needLoanDesc.tr(),
        "backgroundImage": ImageAssets.loanUser,
      },
      {
        "title1": KeyLang.needLoan.tr(),
        "description": KeyLang.needLoanDesc.tr(),
        "backgroundImage": ImageAssets.loanUser,
      },
      {
        "title1": KeyLang.needLoan.tr(),
        "description": KeyLang.needLoanDesc.tr(),
        "backgroundImage": ImageAssets.loanUser,
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
                  indicatorRadius: 5.r,
                  itemSpacing: 12.w,
                  padding: const EdgeInsets.all(6),
                  currentIndicatorColor: AppColors.mainColor,
                  indicatorBackgroundColor: AppColors.white,
                  alignment: Alignment.bottomCenter),
              itemCount: headerSlider.length,
              slideBuilder: (index) {
                return HeaderUserCard(
                    title1: headerSlider[index]['title1'],
                    description: headerSlider[index]['description'],
                    backgroundImage: headerSlider[index]['backgroundImage']);
              },
            ),
          ),
        ]);
  }
}
