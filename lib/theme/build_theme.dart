import 'package:flutter/material.dart';

import '../presentation/utils/app_colors.dart';

ThemeData buildTheme() {
  return ThemeData(
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(size: 20, color: Colors.black),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColor.heavyPurplyBlue,
          ),
          shape: MaterialStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
          ),
          iconColor: MaterialStatePropertyAll(Colors.white)),
    ),
    scaffoldBackgroundColor: AppColor.bgColor,
  );
}
