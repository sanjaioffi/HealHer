import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heal_her/features/recommendation/domain/entities.dart';

import '../../../../config/theme/app_colors.dart';

class WorkoutPreviewWidget extends StatelessWidget {
  const WorkoutPreviewWidget({
    super.key,
    required this.workouts,
  });
  final WorkoutEntity workouts;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/RecommendationDetail',
          arguments: workouts.workoutDetails,
        );
      },
      child: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h),
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage(workouts.workoutImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: .1.h,
              left: 0.1,
              child: Container(
                width: 330.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColor.santaGrey.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fitness',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: AppColor.white),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded,
                            color: AppColor.white)
                      ],
                    ),
                    Text(
                      '100 Workouts',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: AppColor.santaGrey.withOpacity(.4)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
