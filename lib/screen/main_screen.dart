import 'package:ezcredit/widgets/generalWidgets/bottom_nav.dart';
import 'package:ezcredit/widgets/generalWidgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0.h),
          child: DefaultAppBar(),
        ),
        bottomNavigationBar: BottomNavBarWidget(),
        body: HomeScreen()
        //ProfileScreen(),
        );
  }
}
