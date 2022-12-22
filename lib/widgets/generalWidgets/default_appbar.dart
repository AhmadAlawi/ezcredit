import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../lang/change_lang.dart';
import '../../lang/key_lang.dart';
import '../../style/assets.dart';
import '../../theme/app_colors.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  void changeLanguage(BuildContext context) {
    changeLang(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            KeyLang.ezcredit.tr(),
            style:
                AppColors.fredoka.subtitle1!.copyWith(color: AppColors.white),
          ),
          SvgPicture.asset(
            SvgAssets.logo,
            width: 25,
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  changeLang(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.white,
                        width: 1.w,
                      )),
                  width: 30.w,
                  height: 30.w,
                  child: Center(
                    child: Text(
                      KeyLang.ar.tr(),
                      textAlign: TextAlign.center,
                      style: AppColors.fredoka.subtitle2!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      elevation: 0,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Center(
      //       child: GestureDetector(
      //         onTap: () {
      //           changeLang(context);
      //         },
      //         child: Container(
      //           decoration: BoxDecoration(
      //               color: Colors.transparent,
      //               border: Border.all(
      //                 color: AppColors.white,
      //                 width: 1.w,
      //               )),
      //           width: 30.w,
      //           height: 30.w,
      //           child: Center(
      //             child: Text(
      //               KeyLang.ar.tr(),
      //               textAlign: TextAlign.center,
      //               style: AppColors.fredoka.subtitle2!
      //                   .copyWith(color: AppColors.white),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
}
