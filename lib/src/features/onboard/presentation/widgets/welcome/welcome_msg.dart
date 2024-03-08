import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/config/theme/app_colors.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: SizedBox(
        width: 300.h,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Welcome to ',
                style: TextStyle(
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              TextSpan(
                text: 'HealHer',
                style: TextStyle(
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.heavyPurplyBlue,
                ),
              ),
              TextSpan(
                text: ' SmartApp',
                style: TextStyle(
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                  fontSize: 28.sp,
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
