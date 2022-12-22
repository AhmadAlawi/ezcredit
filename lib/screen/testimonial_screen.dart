import 'package:ezcredit/widgets/appWidget/testimonials_widget.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/guest_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../globals.dart';
import '../widgets/guestScreenWidgets/guest_appbar.dart';

class TestimonialsScreen extends StatelessWidget {
  static const String id = 'Testimonials';
  const TestimonialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user == 'guest'
        ? Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: const GuestAppbar(),
            ),
            bottomSheet: const GuestBottomsheet(),
            body: const TestimonialsWidget())
        : const TestimonialsWidget();
  }
}
