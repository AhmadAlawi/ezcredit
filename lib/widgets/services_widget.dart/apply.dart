import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/apply_controller.dart';
import 'package:ezcredit/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../lang/key_lang.dart';
import '../../screen/main_screen_two.dart';
import '../../service/generalServices/update_status.dart';
import '../../style/assets.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/main_button.dart';

class ApplyWidget extends StatelessWidget {
  const ApplyWidget({Key? key}) : super(key: key);

  void updateClicks(BuildContext context) {
    Provider.of<ClickStatus>(context, listen: false).updateClick();
  }

  void decreaseClicks(BuildContext context) {
    Provider.of<ClickStatus>(context, listen: false).decreaseClick();
  }

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
              title: Column(
                children: [
                  SvgPicture.asset(SvgAssets.orderSent),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    KeyLang.orderSuccessfully.tr(),
                    style: AppColors.fredoka.headline6!
                        .copyWith(color: AppColors.buttonColor),
                  ),
                ],
              ),
              content: Text(
                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium ',
                style:
                    AppColors.fredoka.subtitle2!.copyWith(color: Colors.black),
              ),
              actions: [
                MainButton(
                    text: KeyLang.goToProposal.tr(),
                    width: double.infinity,
                    radius: 8.r,
                    color: AppColors.buttonColor,
                    onPressed: () {
                      Navigator.maybePop(myContext);
                      apply = true;
                      Provider.of<ApplyController>(context, listen: false)
                          .applyLoanMap = {};
                      Navigator.pushNamedAndRemoveUntil(
                          context, MainScreenTwo.id, (route) => false);
                    })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplyController>(
        builder: (context, applycontroller, child) {
      return Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                KeyLang.serviceType.tr(),
                style: AppColors.fredoka.subtitle1,
              ),
              SizedBox(height: 8.h),
              Text(
                KeyLang.leons.tr(),
                style: AppColors.fredoka.subtitle2,
              ),
              SizedBox(height: 20.h),
              Text(
                KeyLang.loanType.tr(),
                style: AppColors.fredoka.subtitle1,
              ),
              SizedBox(height: 8.h),
              Text(
                applycontroller.applyLoanMap['loanType'],
                style: AppColors.fredoka.subtitle2,
              ),
              SizedBox(height: 20.h),
              Text(
                KeyLang.bankType.tr(),
                style: AppColors.fredoka.subtitle1,
              ),
              SizedBox(height: 8.h),
              Text(
                applycontroller.applyLoanMap['bankType'],
                style: AppColors.fredoka.subtitle2,
              ),
              SizedBox(height: 20.h),
              Text(
                KeyLang.dueAmount.tr(),
                style: AppColors.fredoka.subtitle1,
              ),
              SizedBox(height: 8.h),
              Text(
                "0.00 ${KeyLang.currencyK.tr()}",
                style: AppColors.fredoka.subtitle2,
              ),
              SizedBox(height: 50.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                MainButton(
                    text: '<< ${KeyLang.previous.tr()}',
                    radius: 10.r,
                    width: 120.w,
                    color: AppColors.lightGrey,
                    onPressed: () {
                      decreaseClicks(context);
                    }),
                MainButton(
                    width: 200.w,
                    radius: 8.r,
                    color: AppColors.buttonColor,
                    text: KeyLang.applyNow.tr(),
                    isDisabled: applycontroller.isLoading,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (myContext) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                titlePadding: EdgeInsets.only(top: 50.h),
                                actionsPadding: EdgeInsets.symmetric(
                                  vertical: 20.h,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 8.h),
                                title: Center(
                                    child: Text(
                                  KeyLang.confirmation.tr(),
                                  style: AppColors.fredoka.headline6!
                                      .copyWith(color: Colors.black),
                                )),
                                content: Text(
                                  KeyLang.wantToApply.tr(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.sp),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      MainButton(
                                          text: KeyLang.cancel.tr(),
                                          radius: 8.r,
                                          width: 115.w,
                                          color: AppColors.lightGrey,
                                          onPressed: () {
                                            Navigator.maybePop(myContext);
                                          }),
                                      MainButton(
                                          text: KeyLang.submit.tr(),
                                          radius: 8.r,
                                          width: 115.w,
                                          color: AppColors.buttonColor,
                                          isDisabled: applycontroller.isLoading,
                                          onPressed: () {
                                            applycontroller.applyLoanHandler(
                                                context, showMyDialog);
                                            Navigator.maybePop(myContext);
                                          }),
                                    ],
                                  )
                                ],
                              ));
                    })
              ]),
            ],
          ),
        ),
      );
    });
  }
}
