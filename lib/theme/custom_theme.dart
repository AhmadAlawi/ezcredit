import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class CustomTheme {
  // * * * * * * * * * * * * *** Light *** * * * * * * * * * * * *
  static ThemeData lightTheme(BuildContext context) {
    AppColors.setTextTheme(context);
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        // iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22.sp,
        ),
      ),

      /// displayColor ~>  headline4, headline3, headline2, headline1, and caption
      /// bodyColor  ~> is applied to the remaining text styles.
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
    );
  }

  // * * * * * * * * * * * * *** Dark *** * * * * * * * * * * * *
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: Colors.white,
            bodyColor: Colors.white,
          ),
    );
  }
}
