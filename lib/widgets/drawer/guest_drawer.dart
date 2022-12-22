import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:ezcredit/screen/lenders_screen.dart';
import 'package:ezcredit/screen/sign_up_screen.dart';
import 'package:ezcredit/screen/term_condition_screen.dart';
import 'package:ezcredit/screen/testimonial_screen.dart';
import 'package:ezcredit/style/assets.dart';
import 'package:ezcredit/widgets/drawer/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../globals.dart';
import '../../lang/change_lang.dart';
import '../../lang/key_lang.dart';
import '../../screen/contact_us_screen.dart';
import '../../screen/guest_screen.dart';
import '../../screen/login_screen.dart';
import '../../screen/privacy_policy_screen.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/main_button.dart';

class GuestDrawer extends StatelessWidget {
  const GuestDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.92),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(SvgAssets.cancel)),
              SizedBox(
                height: 20.h,
              ),
              MainButton(
                textStyle: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
                radius: 8.r,
                text: KeyLang.joinNow.tr(),
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
                width: double.infinity,
                color: AppColors.buttonColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(KeyLang.alreadyMember.tr(),
                        style: AppColors.fredoka.bodySmall!
                            .copyWith(color: AppColors.mainColor)),
                    Text(
                      KeyLang.login.tr(),
                      style: AppColors.fredoka.bodyText2!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  DrawerList(
                    title: KeyLang.home.tr(),
                    icon: SvgAssets.homeDrawer,
                    onTap: () {
                      Navigator.pushNamed(context, GuestScreen.id);
                    },
                  ),
                  DrawerList(
                    title: KeyLang.lenders.tr(),
                    icon: SvgAssets.lendersDrawer,
                    onTap: () {
                      Navigator.pushNamed(context, LendersScreen.id);
                    },
                  ),
                  DrawerList(
                    title: KeyLang.testimonials.tr(),
                    icon: SvgAssets.testimonialsDrawer,
                    onTap: () {
                      Navigator.pushNamed(context, TestimonialsScreen.id);
                    },
                  ),
                  DrawerList(
                    title: KeyLang.needHelp.tr(),
                    icon: SvgAssets.contactUsDrawer,
                    onTap: () {
                      Navigator.pushNamed(context, ContactUsScreen.id);
                    },
                  ),
                  DrawerList(
                      title: KeyLang.termsAndCondition.tr(),
                      icon: SvgAssets.termsDrawer,
                      onTap: () {
                        termsSignup = false;

                        Navigator.pushNamed(
                            context, TermsAndConditionScreen.id);
                      }),
                  DrawerList(
                    title: KeyLang.privacyPolicy.tr(),
                    icon: SvgAssets.privacyDrawer,
                    onTap: () {
                      termsSignup = false;

                      Navigator.pushNamed(context, PrivacyPolicyScreen.id);
                    },
                  ),
                ]),
              )),
              GestureDetector(
                onTap: () {
                  changeLang(context);
                },
                child: Container(
                  padding: EdgeInsets.all(15.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xffCCCCCC)),
                    ),
                    color: Colors.transparent,
                  ),
                  width: double.infinity,
                  child: Text(
                    local == ConfigLanguage.arLocale
                        ? KeyLang.english.tr()
                        : KeyLang.arabic.tr(),
                    textAlign: TextAlign.center,
                    style: AppColors.fredoka.headline6,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
