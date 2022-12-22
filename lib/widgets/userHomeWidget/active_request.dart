import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/model/home_model.dart';
import 'package:ezcredit/style/assets.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../globals.dart';
import '../../theme/app_colors.dart';

class ActiveRequestWidget extends StatelessWidget {
  final Requests? requests;
  const ActiveRequestWidget({Key? key, required this.requests})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            KeyLang.activeRequests.tr(),
            style: AppColors.fredoka.headline6,
          ),
        ),
        SizedBox(
          height: 20.w,
        ),
        requests?.id == null
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'),
                    SizedBox(
                      height: 20.w,
                    ),
                    Consumer<MainScreenController>(
                        builder: (context, mainController, child) {
                      return MainButton(
                        text: KeyLang.getLoanNow.tr(),
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
            : Card(
                elevation: 0,
                child: ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: SvgPicture.asset(
                      SvgAssets.car,
                      color: AppColors.titleColor,
                    ),
                  ),
                  title: Text(
                    '${requests?.type}',
                    style: AppColors.fredoka.bodyMedium!
                        .copyWith(color: AppColors.titleColor),
                  ),
                  subtitle: Text(
                    '${requests?.createdAt?.split('T').first}',
                    style: TextStyle(
                        color: const Color(0xFF333333), fontSize: 12.sp),
                  ),
                  trailing: Text(
                    '${requests?.amount} ${KeyLang.currencyK.tr()}',
                    style: AppColors.fredoka.bodySmall!
                        .copyWith(color: AppColors.mainColor),
                  ),
                ),
              ),
        SizedBox(
          height: 20.w,
        ),
      ],
    );
  }
}
