import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/services/services.dart';
import 'controller/exercise_controller.dart';
import 'widgets/rec_detail_page.dart';

class WorkoutRecommendationPage extends StatelessWidget {
  const WorkoutRecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(serviceLocator<ExerciseController>());

    //
    return GetBuilder<ExerciseController>(builder: (controller) {
      return Scaffold(
        floatingActionButton: controller.exercises.isNotEmpty
            ? FloatingActionButton(
                onPressed: () {
                  Get.to(
                    () => RecommendationDetailPage(
                      exercise: controller.exercises,
                    ),
                  );
                },
                child: const Icon(Icons.start),
              )
            : const SizedBox(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: controller.exercises.isNotEmpty
                ? Column(
                    children: [
                      Column(
                        children: [
                          // Place a image instead of
                          // place holder
                          const Placeholder(),
                          Text(
                            "Start Exercising",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
