import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/notification_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/widgets/generalWidgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controller/main_screen_controller.dart';
import '../theme/app_colors.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationController>(
        builder: (context, notificationController, child) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notification Details', style: AppColors.fredoka.headline5),
            SizedBox(
              height: 20.h,
            ),
            Text('Title', style: AppColors.fredoka.subtitle1),
            SizedBox(
              height: 10.h,
            ),
            Text(
                '${notificationController.userNotification?[notificationController.index].title}',
                style: AppColors.fredoka.subtitle1),
            SizedBox(
              height: 30.h,
            ),
            Text('Date', style: AppColors.fredoka.subtitle1),
            SizedBox(
              height: 10.h,
            ),
            Text(
                '${notificationController.userNotification?[notificationController.index].createdAt?.split('T').first}',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 30.h,
            ),
            Text('Details', style: AppColors.fredoka.subtitle1),
            SizedBox(
              height: 10.h,
            ),
            Text(
                '${notificationController.userNotification?[notificationController.index].body}',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 30.h,
            ),
            notificationController
                        .userNotification?[notificationController.index].type ==
                    'offer'
                ? MainButton(
                    text: KeyLang.goToProposal.tr(),
                    width: double.infinity,
                    radius: 10.r,
                    color: AppColors.buttonColor,
                    onPressed: () {
                      Provider.of<MainScreenController>(context, listen: false)
                          .changeBodyHandler(11);
                    })
                : SizedBox()
          ],
        ),
      );
    });
  }
}
