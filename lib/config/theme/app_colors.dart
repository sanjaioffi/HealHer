import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const Color bgColor = Color.fromRGBO(245, 246, 250, 1);
  static const Color purplyBlue = Color(0xFF8a81f8);
  static const Color heavyPurplyBlue = Color(0xFF7065e2);
  static const Color babyPurplyBlue = Color(0xff6af8dfe);
  static const Color bluishCyan = Color(0xFF7ed1df);
  static const Color bluishCyanLight = Color(0xff7e2fbfc);
  static const Color blue = Color(0xff72189fe);
  static const Color blueLight = Color(0xff7d2e6fe);
  static const Color santaGrey = Color(0xFFa0a3b9);
  static const Color lightPurplrBlue = Color.fromARGB(255, 229, 223, 254);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color steps = Color(0xfff3e2dc);
  static const Color stepsIndicator = Color(0xffff3a37c);
  static const Color heart = Color(0xffffdbe2f5);
  static const Color spo2 = Color(0xfffcffaf3);
  static const Color spo2Indicator = Color(0xfff40dbc1);

  static List<Color> unselectedLinearGradient = [
    AppColor.white,
    AppColor.white,
  ];

  static List<Color> selectedLinearGradient = [
    AppColor.heavyPurplyBlue,
    AppColor.heavyPurplyBlue,
  ];
}
