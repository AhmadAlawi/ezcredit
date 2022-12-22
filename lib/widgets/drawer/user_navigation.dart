import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:ezcredit/style/form_style.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/drawer/user_navigation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../globals.dart';
import '../../lang/key_lang.dart';

import '../../style/assets.dart';

class UserNavigation extends StatelessWidget {
  UserNavigation({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(
        builder: (context, mainController, child) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              KeyLang.more.tr(),
              style: AppColors.fredoka.headline5,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              controller: searchController,
              decoration: AppStyles.formStyle('search',
                  borderColor: AppColors.grey,
                  focusBorderColor: AppColors.grey,
                  radius: 8.r,
                  enabledBorderColor: AppColors.grey,
                  suffixIcon: const Icon(Icons.search)),
            ),
            SizedBox(
              height: 30.h,
            ),
            UserNavigationList(
              title: KeyLang.home.tr(),
              icon: SvgAssets.homeDrawer,
              onTap: () {
                mainController.changeBodyHandler(2);
              },
            ),
            UserNavigationList(
              title: KeyLang.myProfile.tr(),
              icon: SvgAssets.person,
              onTap: () {
                mainController.changeBodyHandler(5);
              },
            ),
            UserNavigationList(
              title: KeyLang.services.tr(),
              icon: SvgAssets.servicesDrawer,
              onTap: () {
                mainController.changeBodyHandler(0);
                selectedServicesIndex = 0;
              },
            ),
            UserNavigationList(
              title: KeyLang.lenders.tr(),
              icon: SvgAssets.lendersDrawer,
              onTap: () {
                mainController.changeBodyHandler(18);
              },
            ),
            UserNavigationList(
              title: KeyLang.proposal.tr(),
              icon: SvgAssets.proposal,
              onTap: () {
                mainController.changeBodyHandler(11);
              },
            ),
            UserNavigationList(
              title: KeyLang.testimonials.tr(),
              icon: SvgAssets.termsDrawer,
              onTap: () {
                mainController.changeBodyHandler(12);
              },
            ),
            UserNavigationList(
              title: KeyLang.contactUs.tr(),
              icon: SvgAssets.contactUsDrawer,
              onTap: () {
                mainController.changeBodyHandler(13);
              },
            ),
            UserNavigationList(
                title: KeyLang.termsAndCondition.tr(),
                icon: SvgAssets.termsDrawer,
                onTap: () {
                  mainController.changeBodyHandler(14);
                }),
            UserNavigationList(
              title: KeyLang.privacyPolicy.tr(),
              icon: SvgAssets.privacyDrawer,
              onTap: () {
                mainController.changeBodyHandler(15);
              },
            ),
            UserNavigationList(
              title: KeyLang.settings.tr(),
              icon: SvgAssets.servicesDrawer,
              onTap: () {
                mainController.changeBodyHandler(16);
              },
            ),
          ],
        ),
      );
    });
  }
}
