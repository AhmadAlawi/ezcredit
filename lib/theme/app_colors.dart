import 'package:flutter/material.dart';

class AppColors {
  // * Convert Color from Hex to type Flutter 0xFFdddddd
  static Color _colorFromHex(String hexColor) {
    final color = hexColor.replaceAll('#', ''); //  #ffffff -> ffffff
    return Color(int.parse('FF$color', radix: 16)); //  0-9 ABCDEF
  }

  // * color App
  static Color mainColor = _colorFromHex('#002046');
  static Color secondaryColor = _colorFromHex('#EBD773');
  static Color primary = _colorFromHex('#C29D3E');
  static Color formHintTextColor = _colorFromHex('#DFE0DF');
  static Color grey = _colorFromHex('#AFAFAF');
  static Color lightGrey = _colorFromHex('#AEAEAE');
  static Color titleColor = _colorFromHex('#AC8C3A');
  static Color buttonColor = _colorFromHex('#7F9746');
  static Color rejectButtonColor = _colorFromHex('#850B0B');
  static Color borderColor = _colorFromHex('##F6F6F6');

  static Color white = _colorFromHex('#FFFFFF');
  static Color dividerColor = _colorFromHex('#E2E1E1');

  static Color bgGradient1 = _colorFromHex('#002046');
  static Color bgGradient2 = _colorFromHex('#004D77');
  static Color bgGradient3 = _colorFromHex('#007D91');
  static Color bgGradient4 = _colorFromHex('#00AC8E');
  static Color bgGradient5 = _colorFromHex('#7FD77B');

  static Color iconColor = _colorFromHex('#B4AA99');
  static Color buttomNavIconColor = _colorFromHex('#989898');
  static Color buttomNavTextColor = _colorFromHex('#6C6C6C');

  static Color formBorderColor = _colorFromHex("#CCCCCC");
  static Color formFillColor = _colorFromHex("#DCDBDB");

  static Color errorColor = _colorFromHex("#AC0C0C");
  static Color lightBackgroundColor = _colorFromHex("#F8F8F8");

  // * loading
  static Color lightLoading = _colorFromHex('#46B5F6');
  static Color darkLoading = _colorFromHex('#BB86FC');

  static final List<Color> backGround = [
    bgGradient1,
    bgGradient2,
    bgGradient3,
    bgGradient4,
    bgGradient5
  ];

  static final List<Color> borderButton = [primary, secondaryColor];

  static late TextTheme fredoka;

  static void setTextTheme(BuildContext context) {
    fredoka = Theme.of(context)
        .textTheme
        .apply(bodyColor: mainColor, fontFamily: 'Fredoka');
  }
}
