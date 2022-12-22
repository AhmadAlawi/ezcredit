import 'package:ezcredit/widgets/generalWidgets/default_scaffold.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/header.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/need_help.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/our_services.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/testimonials.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/why_ezcredit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../controller/general_controller.dart';
import '../style/assets.dart';
import '../widgets/guestScreenWidgets/guest_bottom_sheet.dart';

class GuestScreen extends StatefulWidget {
  static const String id = 'GuestScreen';

  const GuestScreen({Key? key}) : super(key: key);

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  @override
  void initState() {
    getTestimonials();
    super.initState();
  }

  Future getTestimonials() async {
    final generalProvider =
        Provider.of<GeneralController>(context, listen: false);

    await generalProvider.getTestimonialsHandler(context);
  }

  @override
  Widget build(BuildContext context) {
    return EZDefaultScaffold(
      title: SvgPicture.asset(
        SvgAssets.logo,
        width: 25,
        height: 40,
      ),
      bottomSheet: GuestBottomsheet(),
      body: Column(
        children: [
          HeaderGuest(),
          SizedBox(
            height: 32.h,
          ),
          OurServicesWidget(),
          SizedBox(
            height: 20.h,
          ),
          Consumer<GeneralController>(
              builder: (context, generalController, child) {
            if (generalController.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (generalController.testimonialsModel!.isNotEmpty) {
              return Testimonial(
                testimonials: generalController.testimonialsModel,
              );
            } else {
              return const SizedBox();
            }
          }),
          SizedBox(
            height: 20.h,
          ),
          WhyEzCredit(),
          NeedHelp(),
        ],
      ),
    );
  }
}
