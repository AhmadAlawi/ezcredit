import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:ezcredit/controller/offers_controller.dart';
import 'package:ezcredit/widgets/proposalWidget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../globals.dart';
import '../theme/app_colors.dart';

class ProposalScreen extends StatefulWidget {
  static const String id = 'ProposalScreen';

  const ProposalScreen({Key? key}) : super(key: key);

  @override
  State<ProposalScreen> createState() => _ProposalScreenState();
}

class _ProposalScreenState extends State<ProposalScreen> {
  @override
  void initState() {
    Provider.of<OffersController>(context, listen: false)
        .getOffersHandler(context);
    apply = false;
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
                padding: EdgeInsets.symmetric(vertical: 10.h),
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
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Accepted',
                  ),
                  Tab(
                    text: 'Rejected',
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
                  Consumer<OffersController>(
                    builder: (context, offersController, child) {
                      if (offersController.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (offersController.offers!.isEmpty) {
                          return const Center(
                              child: Text('There is No Offers'));
                        } else {
                          return ListView.builder(
                              itemCount: offersController.offers?.length,
                              itemBuilder: (context, index) {
                                return ProposalCardWidget(
                                  bankName: offersController
                                          .offers?[index].banknameEn ??
                                      '',
                                  time: offersController
                                          .offers?[index].createdAt ??
                                      '',
                                  image:
                                      offersController.offers?[index].logoUrl ??
                                          '',
                                  status: offersController
                                      .offers?[index].offerStatus,
                                  onTap: () {
                                    offersController.setOfferIndex(index);

                                    Provider.of<MainScreenController>(context,
                                            listen: false)
                                        .changeBodyHandler(17);
                                  },
                                );
                              });
                        }
                      }
                    },
                  ),
                  Consumer<OffersController>(
                    builder: (context, offersController, child) {
                      if (offersController.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (offersController.offers!.isEmpty) {
                          return const Center(
                              child: Text('There is No Offers'));
                        } else {
                          return ListView.builder(
                              itemCount: offersController.offers?.length,
                              itemBuilder: (context, index) {
                                if (offersController
                                        .offers?[index].offerStatus ==
                                    'pending') {
                                  return ProposalCardWidget(
                                    bankName: offersController
                                            .offers?[index].banknameEn ??
                                        '',
                                    time: offersController
                                            .offers?[index].createdAt ??
                                        '',
                                    image: offersController
                                            .offers?[index].logoUrl ??
                                        '',
                                    status: offersController
                                        .offers?[index].offerStatus,
                                    onTap: () {
                                      offersController.setOfferIndex(index);

                                      Provider.of<MainScreenController>(context,
                                              listen: false)
                                          .changeBodyHandler(17);
                                    },
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              });
                        }
                      }
                    },
                  ),
                  Consumer<OffersController>(
                    builder: (context, offersController, child) {
                      if (offersController.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (offersController.offers!.isEmpty) {
                          return const Center(
                              child: Text('There is No Offers'));
                        } else {
                          return ListView.builder(
                              itemCount: offersController.offers?.length,
                              itemBuilder: (context, index) {
                                if (offersController
                                        .offers?[index].offerStatus ==
                                    'accepted') {
                                  return ProposalCardWidget(
                                    bankName: offersController
                                            .offers?[index].banknameEn ??
                                        '',
                                    time: offersController
                                            .offers?[index].createdAt ??
                                        '',
                                    image: offersController
                                            .offers?[index].logoUrl ??
                                        '',
                                    status: offersController
                                        .offers?[index].offerStatus,
                                    onTap: () {
                                      offersController.setOfferIndex(index);

                                      Provider.of<MainScreenController>(context,
                                              listen: false)
                                          .changeBodyHandler(17);
                                    },
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              });
                        }
                      }
                    },
                  ),
                  Consumer<OffersController>(
                    builder: (context, offersController, child) {
                      if (offersController.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (offersController.offers!.isEmpty) {
                          return const Center(
                              child: Text('There is No Offers'));
                        } else {
                          return ListView.builder(
                              itemCount: offersController.offers?.length,
                              itemBuilder: (context, index) {
                                if (offersController
                                        .offers?[index].offerStatus ==
                                    'rejected') {
                                  return ProposalCardWidget(
                                    bankName: offersController
                                            .offers?[index].banknameEn ??
                                        '',
                                    status: offersController
                                        .offers?[index].offerStatus,
                                    time: offersController
                                            .offers?[index].createdAt ??
                                        '',
                                    image: offersController
                                            .offers?[index].logoUrl ??
                                        '',
                                    onTap: () {
                                      offersController.setOfferIndex(index);

                                      Provider.of<MainScreenController>(context,
                                              listen: false)
                                          .changeBodyHandler(17);
                                    },
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              });
                        }
                      }
                    },
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
