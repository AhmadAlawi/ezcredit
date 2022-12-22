import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/one_ezcredit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../lang/key_lang.dart';
import '../../style/assets.dart';

class WhyEzCredit extends StatelessWidget {
  const WhyEzCredit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> oneCard = [
      {
        "title": KeyLang.customerIsKing.tr(),
        "icon": SvgPicture.asset(
          SvgAssets.king,
          width: 50,
          height: 35,
          fit: BoxFit.cover,
        ),
      },
      {
        "title": KeyLang.allBank.tr(),
        "icon": SvgPicture.asset(
          SvgAssets.allBank,
          width: 50,
          height: 35,
          fit: BoxFit.cover,
        ),
      },
      {
        "title": KeyLang.rightServices.tr(),
        "icon": SvgPicture.asset(
          SvgAssets.right,
          width: 50,
          height: 35,
          fit: BoxFit.cover,
        ),
      },
      {
        "title": KeyLang.speed.tr(),
        "icon": SvgPicture.asset(
          SvgAssets.speed,
          width: 50,
          height: 35,
          fit: BoxFit.cover,
        ),
      },
      {
        "title": KeyLang.higherLeon.tr(),
        "icon": SvgPicture.asset(
          SvgAssets.higherLoan,
          width: 50,
          height: 35,
          fit: BoxFit.cover,
        ),
      },
      {
        "title": KeyLang.competitive.tr(),
        "icon": SvgPicture.asset(
          SvgAssets.rate,
          width: 50,
          height: 35,
          fit: BoxFit.cover,
        ),
      },
    ];

    final List<Map<String, dynamic>> oneCard2 = [
      {
        "title": KeyLang.support.tr(),
        "icon": SvgPicture.asset(
          SvgAssets.support,
          width: 50,
          height: 35,
          fit: BoxFit.cover,
        ),
      },
      {
        "title": KeyLang.updatedCredit.tr(),
        "icon": SvgPicture.asset(
          SvgAssets.updatedCredit,
          width: 50,
          height: 35,
          fit: BoxFit.cover,
        ),
      },
      {
        "title": KeyLang.users.tr(),
        "icon": Text(
          "500K",
          style: AppColors.fredoka.headline5,
        ),
      },
      {
        "title": KeyLang.lenders.tr(),
        "icon": Text(
          "25",
          style: AppColors.fredoka.headline5,
        ),
      },
      {
        "title": KeyLang.loanRequest.tr(),
        "icon": Text(
          "250K",
          style: AppColors.fredoka.headline5,
        ),
      },
      {
        "title": KeyLang.issued.tr(),
        "icon": Text(
          "50K",
          style: AppColors.fredoka.headline5,
        ),
      },
    ];

    return Container(
      padding: EdgeInsets.only(
        top: 32.h,
        left: 10.w,
        right: 10.w,
      ),
      color: AppColors.lightBackgroundColor,
      width: double.infinity,
      height: 450.h,
      child: Column(children: [
        Text(
          KeyLang.whyEZCREDIT.tr().toUpperCase(),
          style: AppColors.fredoka.headline6,
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 370.h,
          child: CarouselSlider(
              enableAutoSlider: true,
              unlimitedMode: true,
              initialPage: 0,
              autoSliderTransitionTime: const Duration(milliseconds: 500),
              slideTransform: const DefaultTransform(),
              slideIndicator: CircularSlideIndicator(
                  indicatorRadius: 5.r,
                  itemSpacing: 12.w,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  currentIndicatorColor: AppColors.mainColor,
                  indicatorBackgroundColor: AppColors.iconColor,
                  alignment: Alignment.bottomCenter),
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    itemCount: oneCard.length,
                    itemBuilder: (context, index) {
                      return OneEzCredit(
                          title: oneCard[index]['title'],
                          icon: oneCard[index]['icon']);
                    }),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    itemCount: oneCard2.length,
                    itemBuilder: (context, index) {
                      return OneEzCredit(
                          title: oneCard2[index]['title'],
                          icon: oneCard2[index]['icon']);
                    }),
              ]),
        ),
      ]),
    );
  }
}
