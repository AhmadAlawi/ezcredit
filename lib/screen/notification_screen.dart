import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/notification_controller.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../controller/main_screen_controller.dart';
import '../theme/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = 'NotificationScreen';

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    getNotifications();
    super.initState();
  }

  Future getNotifications() async {
    final notificationProvider =
        Provider.of<NotificationController>(context, listen: false);

    await notificationProvider.getUserNotificationHandler(context);
  }

  @override
  Widget build(BuildContext context) {
    TabController? tabController;
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: TabBar(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              controller: tabController,
              indicatorColor: AppColors.mainColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.mainColor,
              labelStyle: AppColors.fredoka.bodySmall,
              unselectedLabelColor: const Color(0xff8A867E),
              tabs: [
                Tab(
                  text: KeyLang.all.tr(),
                ),
                Tab(
                  text: KeyLang.proposal.tr(),
                ),
                Tab(
                  text: KeyLang.news.tr(),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 500.h,
                child: TabBarView(children: [
                  Consumer<NotificationController>(
                      builder: (context, notificationController, child) {
                    if (notificationController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (notificationController.userNotification == null) {
                        return const Center(
                            child: Text('There is No Notification'));
                      } else {
                        return ListView.builder(
                            itemCount:
                                notificationController.userNotification?.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  elevation: 1,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 12.h),
                                    child: ListTile(
                                      onTap: () {
                                        notificationController
                                            .setNotificationIndex(index);
                                        Provider.of<MainScreenController>(
                                                context,
                                                listen: false)
                                            .changeBodyHandler(20);
                                      },
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notificationController
                                                    .userNotification?[index]
                                                    .title ??
                                                '',
                                            style: AppColors.fredoka.bodyLarge!
                                                .copyWith(
                                                    fontSize: 20.sp,
                                                    color:
                                                        AppColors.buttonColor),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            notificationController
                                                    .userNotification?[index]
                                                    .body ??
                                                '',
                                            style: TextStyle(
                                                color: AppColors.mainColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 18.sp),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            notificationController
                                                .userNotification![index]
                                                .createdAt!
                                                .split('T')
                                                .first,
                                            style: TextStyle(
                                                color: AppColors.mainColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 15.sp),
                                          ),
                                        ],
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                  ));
                            });
                      }
                    }
                  }),
                  Consumer<NotificationController>(
                      builder: (context, notificationController, child) {
                    if (notificationController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (notificationController.userNotification!.isEmpty) {
                        return const Center(
                            child: Text('There is No Notification'));
                      } else {
                        return ListView.builder(
                            itemCount:
                                notificationController.userNotification?.length,
                            itemBuilder: (context, index) {
                              return notificationController
                                          .userNotification?[index].type ==
                                      'offer'
                                  ? Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      elevation: 1,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w, vertical: 12.h),
                                        child: ListTile(
                                          onTap: () {
                                            notificationController
                                                .setNotificationIndex(index);
                                            Provider.of<MainScreenController>(
                                                    context,
                                                    listen: false)
                                                .changeBodyHandler(20);
                                          },
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                notificationController
                                                        .userNotification?[
                                                            index]
                                                        .title ??
                                                    '',
                                                style: AppColors
                                                    .fredoka.bodyLarge!
                                                    .copyWith(
                                                        fontSize: 20.sp,
                                                        color: AppColors
                                                            .buttonColor),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Text(
                                                notificationController
                                                        .userNotification?[
                                                            index]
                                                        .body ??
                                                    '',
                                                style: TextStyle(
                                                    color: AppColors.mainColor,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 18.sp),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                notificationController
                                                    .userNotification![index]
                                                    .createdAt!
                                                    .split('T')
                                                    .first,
                                                style: TextStyle(
                                                    color: AppColors.mainColor,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 15.sp),
                                              ),
                                            ],
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                      ))
                                  : SizedBox();
                            });
                      }
                    }
                  }),
                  Consumer<NotificationController>(
                      builder: (context, notificationController, child) {
                    if (notificationController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (notificationController.userNotification!.isEmpty) {
                        return const Center(
                            child: Text('There is No Notification'));
                      } else {
                        return ListView.builder(
                            itemCount:
                                notificationController.userNotification?.length,
                            itemBuilder: (context, index) {
                              return notificationController
                                              .userNotification?[index].type ==
                                          'buy_request' ||
                                      notificationController
                                              .userNotification?[index].type ==
                                          'specific'
                                  ? Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      elevation: 1,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w, vertical: 12.h),
                                        child: ListTile(
                                          onTap: () {
                                            notificationController
                                                .setNotificationIndex(index);
                                            Provider.of<MainScreenController>(
                                                    context,
                                                    listen: false)
                                                .changeBodyHandler(20);
                                          },
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                notificationController
                                                        .userNotification?[
                                                            index]
                                                        .title ??
                                                    '',
                                                style: AppColors
                                                    .fredoka.bodyLarge!
                                                    .copyWith(
                                                        fontSize: 20.sp,
                                                        color: AppColors
                                                            .buttonColor),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Text(
                                                notificationController
                                                        .userNotification?[
                                                            index]
                                                        .body ??
                                                    '',
                                                style: TextStyle(
                                                    color: AppColors.mainColor,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 18.sp),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                notificationController
                                                    .userNotification![index]
                                                    .createdAt!
                                                    .split('T')
                                                    .first,
                                                style: TextStyle(
                                                    color: AppColors.mainColor,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 15.sp),
                                              ),
                                            ],
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                      ))
                                  : SizedBox();
                            });
                      }
                    }
                  }),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
