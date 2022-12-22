import 'package:ezcredit/controller/lenders_controller.dart';
import 'package:ezcredit/lang/change_lang.dart';
import 'package:ezcredit/lang/config.dart';
import 'package:ezcredit/widgets/lendersWidget/lenders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../theme/app_colors.dart';

class LendersWidget extends StatefulWidget {
  const LendersWidget({Key? key}) : super(key: key);

  @override
  State<LendersWidget> createState() => _LendersWidgetState();
}

class _LendersWidgetState extends State<LendersWidget> {
  @override
  void initState() {
    Provider.of<LendersController>(context, listen: false)
        .getLendersHandler(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController? tabController;
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFFF3F3F3)),
              child: TabBar(
                indicatorPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 18.w),
                controller: tabController,
                indicatorColor: AppColors.mainColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppColors.mainColor,
                labelStyle: AppColors.fredoka.bodySmall,
                unselectedLabelColor: const Color(0xff8A867E),
                tabs: const [
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Islamic Banks',
                  ),
                  Tab(
                    text: 'Conventional Banks',
                  ),
                  Tab(
                    text: 'Finance Companies Banks',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                height: 500.h,
                child: TabBarView(children: [
                  Consumer<LendersController>(
                      builder: (context, lendersController, child) {
                    if (lendersController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: lendersController.lendersModel?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              LendersCardWidget(
                                image: lendersController
                                        .lendersModel?[index].logoUrl ??
                                    '',
                                bankName: local == ConfigLanguage.arLocale
                                    ? '${lendersController.lendersModel?[index].banknameAr}'
                                    : '${lendersController.lendersModel?[index].banknameEn}',
                                bankType: lendersController
                                        .lendersModel?[index].bankType ??
                                    '',
                              ),
                            ],
                          );
                        });
                  }),
                  Consumer<LendersController>(
                      builder: (context, lendersController, child) {
                    if (lendersController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: lendersController.lendersModel?.length,
                        itemBuilder: (context, index) {
                          if (lendersController.lendersModel?[index].bankType ==
                              'islamic') {
                            return Column(
                              children: [
                                LendersCardWidget(
                                  image: lendersController
                                          .lendersModel?[index].logoUrl ??
                                      '',
                                  bankName: local == ConfigLanguage.arLocale
                                      ? '${lendersController.lendersModel?[index].banknameAr}'
                                      : '${lendersController.lendersModel?[index].banknameEn}',
                                  bankType: lendersController
                                          .lendersModel?[index].bankType ??
                                      '',
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        });
                  }),
                  Consumer<LendersController>(
                      builder: (context, lendersController, child) {
                    if (lendersController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: lendersController.lendersModel?.length,
                        itemBuilder: (context, index) {
                          if (lendersController.lendersModel?[index].bankType ==
                              'commercial') {
                            return Column(
                              children: [
                                LendersCardWidget(
                                  image: lendersController
                                          .lendersModel?[index].logoUrl ??
                                      '',
                                  bankName: local == ConfigLanguage.arLocale
                                      ? '${lendersController.lendersModel?[index].banknameAr}'
                                      : '${lendersController.lendersModel?[index].banknameEn}',
                                  bankType: lendersController
                                          .lendersModel?[index].bankType ??
                                      '',
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        });
                  }),
                  Consumer<LendersController>(
                      builder: (context, lendersController, child) {
                    if (lendersController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: lendersController.lendersModel?.length,
                        itemBuilder: (context, index) {
                          if (lendersController.lendersModel?[index].bankType ==
                              'commercial') {
                            return Column(
                              children: [
                                LendersCardWidget(
                                  image: lendersController
                                          .lendersModel?[index].logoUrl ??
                                      '',
                                  bankName: local == ConfigLanguage.arLocale
                                      ? '${lendersController.lendersModel?[index].banknameAr}'
                                      : '${lendersController.lendersModel?[index].banknameEn}',
                                  bankType: lendersController
                                          .lendersModel?[index].bankType ??
                                      '',
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        });
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
