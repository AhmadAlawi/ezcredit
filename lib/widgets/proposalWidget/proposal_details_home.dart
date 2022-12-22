import 'package:ezcredit/controller/home_data_controller.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:ezcredit/widgets/proposalWidget/offer_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../theme/app_colors.dart';

class ProposalHomeDetails extends StatefulWidget {
  final String? title;
  const ProposalHomeDetails({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<ProposalHomeDetails> createState() => _ProposalHomeDetailsState();
}

class _ProposalHomeDetailsState extends State<ProposalHomeDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeDataController>(
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
                      '${offerController.offersModel?[offerController.index].logoUrl}'),
                  width: 80.w,
                  height: 90.h,
                ),
                Text(
                    '${offerController.offersModel?[offerController.index].banknameEn}',
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
                  'Your Request',
                  style: AppColors.fredoka.headline6!
                      .copyWith(color: AppColors.buttonColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                OffersDetailsCard(
                    title: 'Loan Type',
                    description:
                        '${offerController.offersModel?[offerController.index].requestedLoanType}'),
                OffersDetailsCard(
                    title: 'Loan Amount',
                    description:
                        '${offerController.offersModel?[offerController.index].requestedAmount}'),
                OffersDetailsCard(
                    title: 'Installments',
                    description:
                        '${offerController.offersModel?[offerController.index].requestedInstallmentsNumber}'),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Bank Offer',
                  style: AppColors.fredoka.headline6!
                      .copyWith(color: AppColors.buttonColor),
                ),
                OffersDetailsCard(
                    title: 'Loan Amount',
                    description:
                        '${offerController.offersModel?[offerController.index].offeredAmount}'),
                OffersDetailsCard(
                    title: 'Installments',
                    description:
                        '${offerController.offersModel?[offerController.index].offeredInstallments}'),
                OffersDetailsCard(
                    title: 'Interest Rate',
                    description:
                        '${offerController.offersModel?[offerController.index].offeredInterestRate}'),
                OffersDetailsCard(
                    title: 'Note',
                    description:
                        '${offerController.offersModel?[offerController.index].note}'),
                SizedBox(
                  height: 50.h,
                ),
                offerController
                            .offersModel?[offerController.index].offerStatus ==
                        'pending'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MainButton(
                            text: 'Accept Offer',
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
                                          'Confirmation',
                                          style: AppColors.fredoka.headline6!
                                              .copyWith(color: Colors.black),
                                        )),
                                        content: Text(
                                          'Are you sure you want to Accept the Offer',
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
                                                  text: 'Cancel',
                                                  radius: 8.r,
                                                  width: 115.w,
                                                  color: AppColors.lightGrey,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  }),
                                              MainButton(
                                                  text: 'Accepct Now',
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
                            text: 'Reject Loan',
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
                                          'Confirmation',
                                          style: AppColors.fredoka.headline6!
                                              .copyWith(color: Colors.black),
                                        )),
                                        content: Text(
                                          'Are you sure you want to Reject the Offer',
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
                                                  text: 'Cancel',
                                                  radius: 8.r,
                                                  width: 115.w,
                                                  color: AppColors.lightGrey,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  }),
                                              MainButton(
                                                  text: 'Reject Now',
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
