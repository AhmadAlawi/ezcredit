import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';

class HeaderUserCard extends StatelessWidget {
  final String title1;
  final String description;
  final String backgroundImage;

  const HeaderUserCard({
    Key? key,
    required this.title1,
    required this.description,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 280.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: AssetImage(backgroundImage), fit: BoxFit.fill),
          ColoredBox(color: Colors.black.withOpacity(0.4) // 0: Light, 1: Dark
              ),
          Positioned(
              top: 80.h,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(title1,
                      textAlign: TextAlign.center,
                      style: AppColors.fredoka.headline5!
                          .copyWith(color: AppColors.white)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(description,
                      textAlign: TextAlign.center,
                      style: AppColors.fredoka.bodyText1!.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w100)),
                ],
              ))
        ],
      ),
    );
  }
}
