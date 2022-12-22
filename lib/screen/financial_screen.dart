// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/financial_controller.dart';
import 'package:ezcredit/widgets/profileWidgets/financial_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../lang/key_lang.dart';
import '../theme/app_colors.dart';

class FinancialScreen extends StatefulWidget {
  static const String id = 'FinancialScreen';

  const FinancialScreen({Key? key}) : super(key: key);

  @override
  State<FinancialScreen> createState() => _FinancialScreenState();
}

class _FinancialScreenState extends State<FinancialScreen> {
  @override
  void initState() {
    Provider.of<FinancialController>(context, listen: false)
        .checkFinancialData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialController>(
        builder: (context, financialController, child) {
      if (financialController.isLoading) {
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
                KeyLang.financialInfo.tr().toUpperCase(),
                style: AppColors.fredoka.headline6,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            FinancialWidget(
              financialModel: financialController.financialModel,
            ),
          ],
        );
      }
    });
  }
}
