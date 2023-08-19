import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class TopGrettings extends StatelessWidget {
  const TopGrettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(20),
      ),
      child: SizedBox(
        width: screenWidth(300),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Welcome to ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  letterSpacing: screenHeight(1),
                  fontSize: screenHeight(30),
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              TextSpan(
                text: 'HealHer',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  letterSpacing: screenHeight(1),
                  fontSize: screenHeight(30),
                  fontWeight: FontWeight.bold,
                  color: AppColor.heavyPurplyBlue,
                ),
              ),
              TextSpan(
                text: ' SmartApp',
                style: TextStyle(
                  letterSpacing: screenHeight(1),
                  fontFamily: 'Poppins',
                  fontSize: screenHeight(30),
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
