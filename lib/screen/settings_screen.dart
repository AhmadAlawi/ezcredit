import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/auth_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/settings/change_password.dart';
import 'package:ezcredit/widgets/settings/email_address.dart';
import 'package:ezcredit/widgets/settings/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'SettingsScreen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(KeyLang.settings.tr(), style: AppColors.fredoka.headline5),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            title: Text(KeyLang.emailAddress.tr(),
                style: AppColors.fredoka.subtitle1),
            trailing: Icon(
              Icons.arrow_forward,
              color: AppColors.mainColor,
            ),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              Navigator.pushNamed(context, EmailWidget.id,
                  arguments: {'email': prefs.getString('email')});
            },
          ),
          Divider(
            color: AppColors.dividerColor,
            thickness: 1.5.w,
          ),
          ListTile(
            title: Text(KeyLang.changePassword.tr(),
                style: AppColors.fredoka.subtitle1),
            trailing: Icon(
              Icons.arrow_forward,
              color: AppColors.mainColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, ChangePasswordScreen.id);
            },
          ),
          Divider(
            color: AppColors.dividerColor,
            thickness: 1.5.w,
          ),
          ListTile(
            title:
                Text(KeyLang.language.tr(), style: AppColors.fredoka.subtitle1),
            trailing: Icon(
              Icons.arrow_forward,
              color: AppColors.mainColor,
            ),
            onTap: () {
              Navigator.pushNamed(context, LanguageWidget.id);
            },
          ),
          Divider(
            color: AppColors.dividerColor,
            thickness: 1.5.w,
            height: 40.h,
          ),
          ListTile(
            title:
                Text(KeyLang.logout.tr(), style: AppColors.fredoka.subtitle1),
            onTap: () {
              Provider.of<Authcontroller>(context, listen: false)
                  .logOut(context, null);
            },
          ),
        ],
      ),
    );
  }
}
