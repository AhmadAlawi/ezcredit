import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/screen/sign_up_screen.dart';
import 'package:ezcredit/widgets/appWidget/privacy_policy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../globals.dart';
import '../lang/key_lang.dart';
import '../theme/app_colors.dart';
import '../widgets/guestScreenWidgets/guest_bottom_sheet.dart';
import '../widgets/guestScreenWidgets/guest_appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String id = 'PrivacyPolicyScreen';

  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return termsSignup == true
        ? Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.mainColor,
              title: GestureDetector(
                onTap: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(SignUpScreen.id));
                },
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    Text(
                      KeyLang.signUp.tr(),
                      style: AppColors.fredoka.bodySmall!
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
            body: PrivacyPolicyWidget())
        : user == 'guest'
            ? Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.h),
                  child: GuestAppbar(),
                ),
                bottomSheet: GuestBottomsheet(),
                body: PrivacyPolicyWidget())
            : PrivacyPolicyWidget();
  }
}
