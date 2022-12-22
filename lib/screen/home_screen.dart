import 'package:ezcredit/controller/home_data_controller.dart';
import 'package:ezcredit/widgets/userHomeWidget/active_request.dart';
import 'package:ezcredit/widgets/userHomeWidget/header_slider.dart';
import 'package:ezcredit/widgets/userHomeWidget/recieve_proposal.dart';
import 'package:ezcredit/widgets/userHomeWidget/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getHomeData();
    super.initState();
  }

  Future getHomeData() async {
    final controller = Provider.of<HomeDataController>(context, listen: false);

    await controller.getHomeDataHandler(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserHeaderSlider(),
          UserServicesWidget(),
          Consumer<HomeDataController>(
              builder: (context, homeController, child) {
            if (homeController.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  ActiveRequestWidget(
                    requests: homeController.requests,
                  ),
                  RecievedProposalsWidget(
                    offersModel: homeController.offersModel,
                    requests: homeController.requests,
                  ),
                ],
              );
            }
          })
        ],
      ),
    );
  }
}
