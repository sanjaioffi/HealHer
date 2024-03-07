import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_tile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CalorieInfo extends StatelessWidget {
  const CalorieInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //

          const DietTile(
            dietStatValue: "1.1K Kcal",
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
                    "2100",
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
            percent: 0.9,
            reverse: false,
            arcType: ArcType.FULL,
            startAngle: 0.0,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColor.white,
            arcBackgroundColor: AppColor.purplyBlue,
          ),

          //

          const DietTile(
            dietStatValue: "1K cal",
            dietStatTitle: "Minimum",
            isRightToLeft: true,
          ),
        ],
      ),
    );
  }
}
