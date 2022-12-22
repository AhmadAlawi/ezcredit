import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../style/assets.dart';
import '../theme/app_colors.dart';
import '../widgets/generalWidgets/menu.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
        builder: (context, mainController, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            KeyLang.myProfile.tr(),
            style: AppColors.fredoka.headline5,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        CardMenu(
            title: KeyLang.personalInfo.tr(),
            icon: SvgAssets.person,
            onTap: () async {
              mainController.changeBodyHandler(6);
            }),
        const Divider(),
        CardMenu(
          title: KeyLang.residentialAddress.tr(),
          icon: SvgAssets.homeDrawer,
          onTap: () {
            mainController.changeBodyHandler(7);
          },
        ),
        const Divider(),
        CardMenu(
          title: KeyLang.employmentDetails.tr(),
          icon: SvgAssets.employment,
          onTap: () {
            mainController.changeBodyHandler(8);
          },
        ),
        const Divider(),
        CardMenu(
          title: KeyLang.financialInfo.tr(),
          icon: SvgAssets.servicesDrawer,
          onTap: () {
            mainController.changeBodyHandler(9);
          },
        ),
      ]);
    });
  }
}
