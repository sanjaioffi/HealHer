import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/services/services.dart';
import '../../../../config/theme/app_colors.dart';
import '../controller/exercise_controller.dart';
import 'start_button.dart';
import 'video_player.dart';

class RecommendationDetailPage extends StatelessWidget {
  RecommendationDetailPage({
    Key? key,
  }) : super(key: key);

  //
  final controller = PageController(keepPage: true);
  @override
  Widget build(BuildContext context) {
    Get.put(serviceLocator<ExerciseController>());

    return GetBuilder<ExerciseController>(
      builder: (getxController) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.bgColor,
            title: const Text(
              'Exercises',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: getxController.exercises.length,
                effect: ScrollingDotsEffect(
                  activeStrokeWidth: 2.6,
                  activeDotScale: 1.3,
                  maxVisibleDots: 5,
                  radius: 8.r,
                  spacing: 10,
                  dotHeight: 6.h,
                  dotWidth: 7.w,
                ),
              ),
              SizedBox(
                height: 555.h,
                child: PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int idx = 0;
                        idx < getxController.exercises.length;
                        idx++)
                      Expanded(
                        child: Container(
                          // margin: const EdgeInsets.all(17),
                          width: 300.w,
                          height: double.maxFinite,
                          color: AppColor.bgColor,
                          child: Column(
                            children: [
                              Container(
                                width: 360.w,
                                height: 200.h,
                                margin: EdgeInsets.only(top: 50.h),
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: VideoPlayerWidget(
                                  videoUrl:
                                      getxController.exercises[idx].videoUrl,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                getxController.exercises[idx].workoutName,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                getxController.exercises[idx].workoutSets,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                getxController.exercises[idx].description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColor.black.withOpacity(.4),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SizedBox(height: 50.h, child: const TimerButton())
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
