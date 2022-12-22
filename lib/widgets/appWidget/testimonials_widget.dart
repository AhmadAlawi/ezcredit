import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/controller/general_controller.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/testimonials_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../lang/key_lang.dart';
import '../../theme/app_colors.dart';

class TestimonialsWidget extends StatefulWidget {
  const TestimonialsWidget({Key? key}) : super(key: key);

  @override
  State<TestimonialsWidget> createState() => _TestimonialsWidgetState();
}

class _TestimonialsWidgetState extends State<TestimonialsWidget> {
  @override
  void initState() {
    Provider.of<GeneralController>(context, listen: false)
        .getTestimonialsHandler(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(KeyLang.testimonials.tr(), style: AppColors.fredoka.headline5),
          SizedBox(
            height: 30.h,
          ),
          Consumer<GeneralController>(
              builder: (context, generalController, child) {
            if (generalController.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: generalController.testimonialsModel?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TestimonialsCard(
                              title:
                                  '${generalController.testimonialsModel?[index].body}',
                              name:
                                  '${generalController.testimonialsModel?[index].name}'),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      );
                    }),
              );
            }
          })
        ],
      ),
    );
  }
}
