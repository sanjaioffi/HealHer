import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';

import '../presentation/utils/app_colors.dart';

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'Poppins',
    iconTheme: IconThemeData(
      size: screenHeight(20),
      color: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
        backgroundColor: const MaterialStatePropertyAll(
          AppColor.heavyPurplyBlue,
        ),
        shape: MaterialStatePropertyAll(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                screenWidth(20),
              ),
            ),
          ),
        ),
        iconColor: const MaterialStatePropertyAll(
          Colors.white,
        ),
      ),
    ),
    scaffoldBackgroundColor: AppColor.bgColor,
  );
}
