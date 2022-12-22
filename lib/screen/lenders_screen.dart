import 'package:ezcredit/widgets/lendersWidget/lenders_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../globals.dart';
import '../widgets/guestScreenWidgets/guest_appbar.dart';

class LendersScreen extends StatelessWidget {
  static const String id = 'Lenders';

  const LendersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user == 'guest'
        ? Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: const GuestAppbar(),
            ),
            body: const LendersWidget())
        : const LendersWidget();
  }
}
