import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../controller/main_screen_controller.dart';
import '../../globals.dart';
import '../../lang/key_lang.dart';
import '../../style/assets.dart';
import '../../theme/app_colors.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
        builder: (context, mainController, child) {
      return Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 3, 0),
                spreadRadius: 0,
                blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                mainController.changeBodyHandler(2);
              },
              child: Container(
                width: 90.w,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgAssets.homeDrawer,
                        width: 33.w,
                        height: 33.h,
                        color: mainController.pageIndex == 2
                            ? AppColors.mainColor
                            : AppColors.buttomNavIconColor),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      KeyLang.home.tr(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: mainController.pageIndex == 2
                            ? AppColors.mainColor
                            : AppColors.buttomNavTextColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                mainController.changeBodyHandler(0);
                selectedServicesIndex = 0;
              },
              child: Container(
                width: 90.w,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      mainController.pageIndex == 0
                          ? SvgAssets.servicesDrawer
                          : SvgAssets.serviceBottom,
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      KeyLang.services.tr(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: mainController.pageIndex == 0
                              ? AppColors.mainColor
                              : AppColors.buttomNavTextColor),
                    )
                  ],
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     mainController.changeBodyHandler(1);
            //   },
            //   child: Container(
            //     color: Colors.transparent,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         SvgPicture.asset(
            //           mainController.pageIndex == 1
            //               ? SvgAssets.offers
            //               : SvgAssets.offersBottom,
            //         ),
            //         SizedBox(
            //           height: 4.h,
            //         ),
            //         Text(
            //           KeyLang.offers.tr(),
            //           style: TextStyle(
            //               color: mainController.pageIndex == 1
            //                   ? AppColors.mainColor
            //                   : AppColors.buttomNavTextColor),
            //         )
            //       ],
            //     ),
            //   ),
            // ),

            GestureDetector(
              onTap: () {
                mainController.changeBodyHandler(3);
              },
              child: Container(
                width: 90.w,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgAssets.notification,
                        width: 30.w,
                        height: 30.h,
                        color: mainController.pageIndex == 3
                            ? AppColors.mainColor
                            : AppColors.buttomNavIconColor),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      KeyLang.notifications.tr(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: mainController.pageIndex == 3
                              ? AppColors.mainColor
                              : AppColors.buttomNavTextColor),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                mainController.changeBodyHandler(4);
              },
              child: Container(
                width: 90.w,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgAssets.drawer,
                        width: 26.w,
                        height: 26.h,
                        color: mainController.pageIndex == 4
                            ? AppColors.mainColor
                            : AppColors.buttomNavIconColor),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      KeyLang.more.tr(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: mainController.pageIndex == 4
                              ? AppColors.mainColor
                              : AppColors.buttomNavTextColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
