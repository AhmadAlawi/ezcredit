import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../lang/change_lang.dart';
import '../../lang/key_lang.dart';
import '../../style/assets.dart';
import '../../theme/app_colors.dart';

class GuestAppbar extends StatelessWidget {
  final Widget? title;
  const GuestAppbar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
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
    );
  }
}
