// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/widgets/profileWidgets/personla_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../controller/profile_controller.dart';
import '../lang/key_lang.dart';
import '../theme/app_colors.dart';

class PersonalInformationScreen extends StatefulWidget {
  static const String id = 'PersonalInfoScreen';

  const PersonalInformationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileController>(context, listen: false)
          .checkProfileData(context);
      Provider.of<ProfileController>(context, listen: false)
          .getProfileFromSharedPrefrence(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
        builder: (context, profileController, child) {
      if (profileController.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                KeyLang.personalInformation.tr(),
                style: AppColors.fredoka.headline6,
              ),
            ),
            const PersonalInfoField(),
          ],
        );
      }
    });
  }
}
