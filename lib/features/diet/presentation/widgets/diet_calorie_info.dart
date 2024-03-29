import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../config/theme/app_colors.dart';
import '../controller/diet_controller.dart';
import 'diet_tile.dart';

class CalorieInfo extends StatelessWidget {
  const CalorieInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
      child: GetBuilder<DietController>(
          //
          builder: (controller) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //

            DietTile(
              dietStatValue: "${(controller.caloriesRequired.value)} KCal",
              dietStatTitle: "Required",
            ),

            CircularPercentIndicator(
              center: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.food_bank_outlined,
                      size: 50.sp,
                      color: AppColor.white,
                    ),
                    Text(
                      controller.caloriesRequired.value.toString(),
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'Kcal',
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              radius: 80.r,
              animation: true,
              animationDuration: 500,
              lineWidth: 12.0,
              percent: controller.currentCalories.value,
              reverse: false,
              arcType: ArcType.FULL,
              startAngle: 0.0,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: AppColor.white,
              arcBackgroundColor: AppColor.purplyBlue,
            ),

            const DietTile(
              dietStatValue: "28g Fibre",
              dietStatTitle: "Minimum",
              isRightToLeft: true,
            ),
          ],
        );
      }),
    );
  }
}
