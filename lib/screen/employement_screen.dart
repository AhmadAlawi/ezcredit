// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/widgets/profileWidgets/employement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../controller/employment_controller.dart';
import '../lang/key_lang.dart';
import '../theme/app_colors.dart';

class EmployementScreen extends StatefulWidget {
  static const String id = 'EmploymentScreen';

  const EmployementScreen({Key? key}) : super(key: key);

  @override
  State<EmployementScreen> createState() => _EmployementScreenState();
}

class _EmployementScreenState extends State<EmployementScreen> {
  @override
  void initState() {
    Provider.of<EmploymentController>(context, listen: false)
        .checkEmploymentData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EmploymentController>(
        builder: (context, employmentController, child) {
      if (employmentController.isLoading == true) {
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
                KeyLang.employmentDetails.tr().toUpperCase(),
                style: AppColors.fredoka.headline6,
              ),
            ),
            const EmployementWidget(),
          ],
        );
      }
    });
  }
}
