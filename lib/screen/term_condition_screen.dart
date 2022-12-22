import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/screen/sign_up_screen.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/appWidget/terms_widget.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/guest_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../globals.dart';
import '../widgets/guestScreenWidgets/guest_bottom_sheet.dart';

class TermsAndConditionScreen extends StatelessWidget {
  static const String id = 'TermsAndCondition';
  const TermsAndConditionScreen({Key? key}) : super(key: key);

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
            body: TermsWidget())
        : user == 'guest'
            ? Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.h),
                  child: GuestAppbar(),
                ),
                bottomSheet: GuestBottomsheet(),
                body: TermsWidget())
            : TermsWidget();
  }
}
