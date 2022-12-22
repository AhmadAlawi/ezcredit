import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/generalWidgets/common_ui.dart';
import 'package:ezcredit/widgets/services_widget.dart/loan_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/apply_controller.dart';
import '../service/generalServices/update_status.dart';
import '../widgets/generalWidgets/main_button.dart';
import 'apply_loan_screen.dart';

class LoanDetailsScreen extends StatefulWidget {
  static const String id = 'LoanDetailsScreen';

  final String title;
  const LoanDetailsScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<LoanDetailsScreen> createState() => _LoanDetailsScreenState();
}

class _LoanDetailsScreenState extends State<LoanDetailsScreen> {
  void showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (myContext) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              titlePadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              actionsPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              title: Text(
                KeyLang.activeRequests.tr(),
                style: AppColors.fredoka.headline6!
                    .copyWith(color: AppColors.buttonColor),
              ),
              content: Text(
                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident',
                style:
                    AppColors.fredoka.subtitle2!.copyWith(color: Colors.black),
              ),
              actions: [
                MainButton(
                    text: 'Ok',
                    width: double.infinity,
                    radius: 8.r,
                    color: AppColors.buttonColor,
                    onPressed: () {
                      Navigator.maybePop(myContext);
                    })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        leadingWidth: 150.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                Text(
                  KeyLang.services.tr(),
                  style: TextStyle(color: AppColors.white, fontSize: 18.sp),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet:
          Consumer<ApplyController>(builder: (context, applyController, child) {
        return GestureDetector(
          onTap: applyController.isLoading
              ? null
              : () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String? sentLoanDate = prefs.getString('sentLoanDate');

                  if (sentLoanDate?.isNotEmpty ?? false) {
                    if (DateTime.now()
                            .compareTo(DateTime.parse('$sentLoanDate')) <
                        7) {
                      showMyDialog(context);
                    }
                  } else {
                    await applyController.getProfileData(context);
                    if (!mounted) return;
                    Provider.of<ClickStatus>(context, listen: false).click = 1;
                    Navigator.pushNamed(context, ApplyLoanScreen.id);
                  }
                },
          child: Container(
            width: double.infinity,
            height: 70.h,
            decoration: BoxDecoration(
                color: applyController.isLoading
                    ? Colors.grey.withOpacity(0.4)
                    : AppColors.buttonColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    topRight: Radius.circular(14.r))),
            child: Center(
              child: Text(KeyLang.applyNow.tr(),
                  style: AppColors.fredoka.headline6!
                      .copyWith(color: AppColors.white)),
            ),
          ),
        );
      }),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: LoanDetailsWidget(
                title: widget.title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
