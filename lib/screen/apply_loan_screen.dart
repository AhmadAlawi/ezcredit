import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/apply_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/service/generalServices/update_status.dart';
import 'package:ezcredit/widgets/services_widget.dart/apply.dart';
import 'package:ezcredit/widgets/services_widget.dart/employment_field_apply.dart';
import 'package:ezcredit/widgets/services_widget.dart/new_loan.dart';
import 'package:ezcredit/widgets/services_widget.dart/personal_field_apply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../globals.dart';
import '../theme/app_colors.dart';

class ApplyLoanScreen extends StatelessWidget {
  static const String id = 'ApplyLoanScreen';

  ApplyLoanScreen({Key? key}) : super(key: key);

  int statuss = 0;

  Widget point(bool status, String text) => Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          border: Border.all(
              color: status ? AppColors.buttonColor : AppColors.grey, width: 1),
          color: status ? AppColors.buttonColor : Colors.transparent,
          shape: BoxShape.circle),
      child: Center(
        child: Text(text,
            style: AppColors.fredoka.bodyText1!.copyWith(
              color: status ? AppColors.white : AppColors.grey,
            )),
      ));

  Widget line(width) => Container(
        width: (width / 3.5.w) - (width / 10.5.w),
        height: 3.h,
        decoration: BoxDecoration(color: AppColors.grey),
      );

  Widget spaceBetween(width) => SizedBox(width: (width / 16));

  SizedBox text(String text, double width, bool status) => SizedBox(
        width: (width / 3.5.w) - (width / 10.5.w) - 2.w,
        child: Text(text,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
                fontSize: 11.sp,
                color: status ? AppColors.buttonColor : AppColors.grey)),
      );

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    statuss = Provider.of<ClickStatus>(context).click;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF3F3F3),
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          leadingWidth: 250.w,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Provider.of<ApplyController>(context, listen: false)
                    .applyLoanMap = {};
              },
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios),
                  Text(
                    '$loanTitle',
                    style: TextStyle(color: AppColors.white, fontSize: 18.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.h),
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      KeyLang.applyNow.tr(),
                      style: AppColors.fredoka.headline5,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      point(statuss >= 1, "1"),
                      line(width),
                      point(statuss >= 2, "2"),
                      line(width),
                      point(statuss >= 3, "3"),
                      line(width),
                      point(statuss >= 4, "4"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(KeyLang.personal.tr(), width, statuss >= 1),
                        spaceBetween(
                          width,
                        ),
                        text(KeyLang.employmentInfo.tr(), width, statuss >= 2),
                        spaceBetween(width),
                        text(KeyLang.newLoan.tr(), width, statuss >= 3),
                        spaceBetween(width),
                        text(KeyLang.apply.tr(), width, statuss == 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            statuss == 1
                ? PersonalFieldApply(
                    status: statuss,
                  )
                : statuss == 2
                    ? EmploymentFieldApply(
                        status: statuss,
                      )
                    : statuss == 3
                        ? NewLoenWidget(
                            status: statuss,
                          )
                        : statuss == 4
                            ? const ApplyWidget()
                            : const SizedBox(),
          ],
        ));
  }
}
