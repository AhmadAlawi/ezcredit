// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/auth_controller.dart';
import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:ezcredit/lang/change_lang.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/style/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../theme/app_colors.dart';

class SecondAppBar extends StatelessWidget {
  final String? title;

  const SecondAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
        builder: (context, mainController, child) {
      return AppBar(
        backgroundColor: AppColors.mainColor,
        title: mainController.pageIndex == 10
            ? const SizedBox()
            : GestureDetector(
                onTap: () {
                  mainController.pageIndex == 6 ||
                          mainController.pageIndex == 7 ||
                          mainController.pageIndex == 8 ||
                          mainController.pageIndex == 9
                      ? mainController.changeBodyHandler(5)
                      : mainController.pageIndex == 17 ||
                              mainController.pageIndex == 19
                          ? mainController.changeBodyHandler(11)
                          : mainController.pageIndex == 0 ||
                                  mainController.pageIndex == 1 ||
                                  mainController.pageIndex == 3 ||
                                  mainController.pageIndex == 4
                              ? mainController.changeBodyHandler(2)
                              : mainController.changeBodyHandler(4);
                },
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    Text(
                      title ?? KeyLang.home.tr(),
                      style: TextStyle(color: AppColors.white, fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
        actions: [
          mainController.pageIndex == 4 ||
                  mainController.pageIndex == 13 ||
                  mainController.pageIndex == 14 ||
                  mainController.pageIndex == 15 ||
                  mainController.pageIndex == 16
              ? IconButton(
                  onPressed: () async {
                    mainController.pageIndex = 2;
                    Provider.of<Authcontroller>(context, listen: false)
                        .logOut(context, null);
                  },
                  icon: SvgPicture.asset(local == ConfigLanguage.arLocale
                      ? SvgAssets.logoutAr
                      : SvgAssets.logout))
              : mainController.pageIndex == 5 ||
                      mainController.pageIndex == 6 ||
                      mainController.pageIndex == 7 ||
                      mainController.pageIndex == 8 ||
                      mainController.pageIndex == 9
                  ? IconButton(
                      onPressed: () {
                        mainController.changeBodyHandler(10);
                      },
                      icon: const Icon(Icons.info_outline))
                  : mainController.pageIndex == 10
                      ? IconButton(
                          onPressed: () {
                            mainController.changeBodyHandler(2);
                          },
                          icon: const Icon(Icons.close_outlined))
                      : const SizedBox(),
        ],
      );
    });
  }
}
