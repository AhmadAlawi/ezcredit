import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/model/testimonials_model.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/testimonials_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../lang/key_lang.dart';
import '../../theme/app_colors.dart';

class Testimonial extends StatelessWidget {
  final List<TestimonialsModel>? testimonials;
  const Testimonial({Key? key, this.testimonials}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KeyLang.ourUsersSay.tr(),
            style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 200.h,
            child: CarouselSlider.builder(
              enableAutoSlider: true,
              unlimitedMode: true,
              initialPage: 0,
              autoSliderTransitionTime: const Duration(milliseconds: 500),
              slideTransform: const DefaultTransform(),
              slideIndicator: CircularSlideIndicator(
                  indicatorRadius: 5.r,
                  itemSpacing: 12.w,
                  padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 10.h),
                  currentIndicatorColor: AppColors.mainColor,
                  indicatorBackgroundColor: AppColors.iconColor,
                  alignment: Alignment.bottomCenter),
              itemCount: 5,
              slideBuilder: (index) {
                return TestimonialsCard(
                    title: testimonials?[index].body ?? '',
                    name: testimonials?[index].name ?? '');
              },
            ),
          ),
        ],
      ),
    );
  }
}
