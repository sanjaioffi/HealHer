import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../config/theme/app_colors.dart';

class BmiIndicator extends StatelessWidget {
  const BmiIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: CircularPercentIndicator(
        center: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.directions_walk_rounded,
                size: 50.sp,
                color: AppColor.white,
              ),
              const Text("7254",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  )),
              const Text(
                'steps',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
        radius: 110.0,
        animation: true,
        animationDuration: 1000,
        lineWidth: 15.0,
        percent: 0.9,
        reverse: false,
        arcType: ArcType.FULL,
        startAngle: 0.0,
        animateFromLastPercent: true,
        circularStrokeCap: CircularStrokeCap.round,
        backgroundColor: AppColor.lightPurplrBlue,
        progressColor: AppColor.purplyBlue,
        arcBackgroundColor: AppColor.lightPurplrBlue,
      ),
    );
  }
}
