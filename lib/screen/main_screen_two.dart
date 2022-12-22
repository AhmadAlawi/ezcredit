import 'package:ezcredit/controller/main_screen_controller.dart';
import 'package:ezcredit/widgets/appWidget/body_main.dart';
import 'package:ezcredit/widgets/generalWidgets/bottom_nav.dart';
import 'package:ezcredit/widgets/generalWidgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainScreenTwo extends StatefulWidget {
  static const String id = 'MainScreenTwo';

  const MainScreenTwo({Key? key}) : super(key: key);

  @override
  State<MainScreenTwo> createState() => _MainScreenTwoState();
}

class _MainScreenTwoState extends State<MainScreenTwo> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var mainController =
        Provider.of<MainScreenController>(context, listen: true);
    return Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.0.h),
            child: mainController.titleAppBar ?? DefaultAppBar()),
        bottomNavigationBar: BottomNavBarWidget(),
        body: BodyMainScreen());
  }
}
