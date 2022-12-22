import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/offers_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:ezcredit/widgets/proposalWidget/offer_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../theme/app_colors.dart';

class ProposalDetails extends StatefulWidget {
  final String? title;
  const ProposalDetails({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<ProposalDetails> createState() => _ProposalDetailsState();
}

class _ProposalDetailsState extends State<ProposalDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OffersController>(
        builder: (context, offerController, child) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                  image: NetworkImage(
                      '${offerController.offers?[offerController.index].logoUrl}'),
                  width: 80.w,
                  height: 90.h,
                ),
                Text(
                    '${offerController.offers?[offerController.index].banknameEn}',
                    style: AppColors.fredoka.headline5),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  KeyLang.yourRequest.tr(),
                  style: AppColors.fredoka.headline6!
                      .copyWith(color: AppColors.buttonColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                OffersDetailsCard(
                    title: KeyLang.loanType.tr(),
                    description:
                        '${offerController.offers?[offerController.index].requestedLoanType}'),
                OffersDetailsCard(
                    title: KeyLang.loanAMount.tr(),
                    description:
                        '${offerController.offers?[offerController.index].requestedAmount}'),
                OffersDetailsCard(
                    title: KeyLang.installmentsNumber.tr(),
                    description:
                        '${offerController.offers?[offerController.index].requestedInstallmentsNumber}'),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  KeyLang.bankOffer.tr(),
                  style: AppColors.fredoka.headline6!
                      .copyWith(color: AppColors.buttonColor),
                ),
                OffersDetailsCard(
                    title: KeyLang.loanAMount.tr(),
                    description:
                        '${offerController.offers?[offerController.index].offeredAmount}'),
                OffersDetailsCard(
                    title: KeyLang.installmentsNumber.tr(),
                    description:
                        '${offerController.offers?[offerController.index].offeredInstallments}'),
                OffersDetailsCard(
                    title: KeyLang.intrestRate.tr(),
                    description:
                        '${offerController.offers?[offerController.index].offeredInterestRate}'),
                OffersDetailsCard(
                    title: KeyLang.note.tr(),
                    description:
                        '${offerController.offers?[offerController.index].note}'),
                SizedBox(
                  height: 50.h,
                ),
                offerController.offers?[offerController.index].offerStatus ==
                        'pending'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MainButton(
                            text: KeyLang.acceptOffer.tr(),
                            textStyle: AppColors.fredoka.subtitle1!
                                .copyWith(color: AppColors.white),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        titlePadding:
                                            EdgeInsets.only(top: 50.h),
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
                                          KeyLang.confirmationAcceptOffer.tr(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp),
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
                                                    Navigator.pop(context);
                                                  }),
                                              MainButton(
                                                  text: KeyLang.acceptNow.tr(),
                                                  radius: 8.r,
                                                  width: 115.w,
                                                  color: AppColors.buttonColor,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  }),
                                            ],
                                          )
                                        ],
                                      ));
                            },
                            radius: 8.r,
                            color: AppColors.buttonColor,
                          ),
                          MainButton(
                            text: KeyLang.rejectOffer.tr(),
                            textStyle: AppColors.fredoka.subtitle1!
                                .copyWith(color: AppColors.white),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        titlePadding:
                                            EdgeInsets.only(top: 50.h),
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
                                          KeyLang.confirmationRejectOffer.tr(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp),
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
                                                    Navigator.pop(context);
                                                  }),
                                              MainButton(
                                                  text: KeyLang.rejectNow.tr(),
                                                  radius: 8.r,
                                                  width: 115.w,
                                                  color: AppColors
                                                      .rejectButtonColor,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  }),
                                            ],
                                          )
                                        ],
                                      ));
                            },
                            radius: 8.r,
                            color: AppColors.rejectButtonColor,
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            )
          ],
        ),
      );
    });
  }
}
