import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/home_data_controller.dart';
import 'package:ezcredit/globals.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/model/home_model.dart';
import 'package:ezcredit/model/offers_model.dart';
import 'package:ezcredit/widgets/proposalWidget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/main_screen_controller.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/main_button.dart';

class RecievedProposalsWidget extends StatelessWidget {
  final List<OffersModel>? offersModel;
  final Requests? requests;
  const RecievedProposalsWidget({Key? key, this.offersModel, this.requests})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            KeyLang.recievedProposals.tr(),
            style: AppColors.fredoka.headline6,
          ),
        ),
        SizedBox(
          height: 20.w,
        ),
        offersModel == [] || offersModel!.isEmpty
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
                    SizedBox(
                      height: 20.w,
                    ),
                    requests?.id != null
                        ? const SizedBox()
                        : Consumer<MainScreenController>(
                            builder: (context, mainController, child) {
                            return MainButton(
                              text: KeyLang.requestAservice.tr(),
                              onPressed: () {
                                selectedServicesIndex = 0;
                                mainController.changeBodyHandler(0);
                              },
                              width: double.infinity,
                              radius: 8.r,
                              color: AppColors.buttonColor,
                            );
                          }),
                  ],
                ),
              )
            : SizedBox(
                height: 300.h,
                child: ListView.builder(
                    itemCount: offersModel?.length,
                    itemBuilder: (context, index) {
                      return ProposalCardWidget(
                        bankName: offersModel?[index].banknameAr ?? '',
                        time: offersModel?[index].createdAt ?? '',
                        status: offersModel?[index].offerStatus,
                        image: offersModel?[index].logoUrl ?? '',
                        onTap: () {
                          Provider.of<HomeDataController>(context,
                                  listen: false)
                              .setOfferIndex(index);

                          Provider.of<MainScreenController>(context,
                                  listen: false)
                              .changeBodyHandler(19);
                        },
                      );
                    })),
      ],
    );
  }
}
