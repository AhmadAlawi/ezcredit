import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/services_widget.dart/loan_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../globals.dart';
import '../lang/key_lang.dart';

class ServicesScreen extends StatelessWidget {
  static const String id = 'ServicesScreen';

  final Uri? url;
  ServicesScreen({Key? key, this.url}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedServicesIndex ?? 0,
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              KeyLang.services.tr(),
              style: AppColors.fredoka.headline5,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
            child: TabBar(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              controller: tabController,
              indicatorColor: AppColors.mainColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.mainColor,
              labelStyle: AppColors.fredoka.bodySmall,
              unselectedLabelColor: const Color(0xff8A867E),
              tabs: [
                Tab(
                  text: KeyLang.leons.tr().toUpperCase(),
                ),
                Tab(
                  text: KeyLang.creditCard.tr().toUpperCase(),
                ),
                Tab(
                  text: KeyLang.deposits.tr(),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                height: 500.h,
                child: TabBarView(children: [
                  LoanTypeWidget(),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
