import 'package:ezcredit/widgets/appWidget/contactus_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../globals.dart';
import '../widgets/guestScreenWidgets/guest_bottom_sheet.dart';
import '../widgets/guestScreenWidgets/guest_appbar.dart';

class ContactUsScreen extends StatelessWidget {
  static const String id = 'ContactUsScreen';

  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user == 'guest'
        ? Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: GuestAppbar(),
            ),
            bottomSheet: GuestBottomsheet(),
            body: ContactUsWidget())
        : ContactUsWidget();
  }
}
