import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller/exercise_controller.dart';
import 'widgets/rec_detail_page.dart';

class WorkoutRecommendationPage extends StatelessWidget {
  const WorkoutRecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    //
    return GetBuilder<ExerciseController>(builder: (controller) {
      return Scaffold(
        floatingActionButton: controller.exercises.isNotEmpty
            ? FloatingActionButton(
                onPressed: () {
                  Get.to(
                    () => RecommendationDetailPage(),
                  );
                },
                child: const Icon(Icons.start),
              )
            : const SizedBox(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: controller.exercises.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.exercises.length,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title: Text("Hi"),
                      );
                    },
                  )

                //
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
