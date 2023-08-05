import 'package:flutter/material.dart';

import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';

class QuickSignUp extends StatelessWidget {
  const QuickSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: screenHeight(50),
            width: screenWidth(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight(15)),
                color: AppColor.purplyBlue.withOpacity(.05)),
            child: Center(
              child: Image.asset(
                'assets/png/google.png',
                height: screenWidth(20),
                width: screenWidth(20),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: screenHeight(50),
            width: screenWidth(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight(15)),
                color: AppColor.purplyBlue.withOpacity(.05)),
            child: Center(
                child: Image.asset(
              'assets/png/apple-logo.png',
              height: screenWidth(20),
              width: screenWidth(20),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: screenHeight(50),
            width: screenWidth(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight(15)),
                color: AppColor.purplyBlue.withOpacity(.05)),
            child: Center(
              child: Image.asset(
                'assets/png/microsoft.png',
                height: screenWidth(20),
                width: screenWidth(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
