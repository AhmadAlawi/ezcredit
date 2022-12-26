import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/style/assets.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../globals.dart';

class UserServicesWidget extends StatelessWidget {
  const UserServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KeyLang.ezCreditServices.tr(),
            style: AppColors.fredoka.headline6,
          ),
          SizedBox(
            height: 20.w,
          ),
          Consumer<MainScreenController>(
              builder: (context, mainController, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    mainController.changeBodyHandler(0);
                    selectedServicesIndex = 0;
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.loan,
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(KeyLang.leons.tr(),
                          style: AppColors.fredoka.bodyLarge!.copyWith(
                            color: AppColors.titleColor,
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    mainController.changeBodyHandler(0);
                    selectedServicesIndex = 1;
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.loan,
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(KeyLang.carleasing.tr(),
                          style: AppColors.fredoka.bodyLarge!.copyWith(
                            color: AppColors.titleColor,
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    mainController.changeBodyHandler(0);
                    selectedServicesIndex = 2;
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.creditCard,
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(KeyLang.creditCard.tr(),
                          style: AppColors.fredoka.bodyLarge!.copyWith(
                            color: AppColors.titleColor,
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    mainController.changeBodyHandler(0);
                    selectedServicesIndex = 3;
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.bestInterest,
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(KeyLang.deposits.tr(),
                          style: AppColors.fredoka.bodyLarge!.copyWith(
                            color: AppColors.titleColor,
                          )),
                    ],
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
