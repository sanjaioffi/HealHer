import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'package:heal_her/features/recommendation/domain/entities.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/workout_pre.dart';

class WorkoutRecommendationPage extends StatelessWidget {
  const WorkoutRecommendationPage({super.key});

  final WorkoutEntity workouts = const WorkoutEntity(
    workoutCount: 100,
    workoutType: "Cardio",
    workoutImageUrl:
        "https://www.shutterstock.com/image-photo/young-man-sportswear-running-on-600nw-428663329.jpg",
    workoutDetails: [
      WorkoutDetailEntity(
          workoutName: "Cardio",
          description:
              "Cardio is a type of exercise that gets your heart rate up and makes you breathe harder. It is a great way to keep your heart healthy and to burn calories.",
          videoUrl: "https://www.youtube.com/watch?v=IrA9dvgRKR0",
          kcal: "200",
          duration: "30",
          equipment: ["Treadmill", "Elliptical", "Stationary bike"]),
    ],
  );
  final WorkoutEntity workouts2 = const WorkoutEntity(
    workoutCount: 100,
    workoutType: "Cardio",
    workoutImageUrl:
        "https://origympersonaltrainercourses.co.uk/files/img_cache/6797/570_400_1_1595248240_homeworkout-image.jpg?1701183962",
    workoutDetails: [
      WorkoutDetailEntity(
          workoutName: "Cardio",
          description:
              "Cardio is a type of exercise that gets your heart rate up and makes you breathe harder. It is a great way to keep your heart healthy and to burn calories.",
          videoUrl: "https://www.youtube.com/watch?v=IrA9dvgRKR0",
          kcal: "200",
          duration: "30",
          equipment: ["Treadmill", "Elliptical", "Stationary bike"]),
    ],
  );
  final WorkoutEntity workouts3 = const WorkoutEntity(
    workoutCount: 100,
    workoutType: "Cardio",
    workoutImageUrl:
        "https://luna-askmen-images.askmen.com/fitness/workout/what-are-the-disadvantages-of-cardiovascular-exercise/askmen-lead-image-template-1-1692801598.png",
    workoutDetails: [
      WorkoutDetailEntity(
          workoutName: "Cardio",
          description:
              "Cardio is a type of exercise that gets your heart rate up and makes you breathe harder. It is a great way to keep your heart healthy and to burn calories.",
          videoUrl: "https://www.youtube.com/watch?v=IrA9dvgRKR0",
          kcal: "200",
          duration: "30",
          equipment: ["Treadmill", "Elliptical", "Stationary bike"]),
    ],
  );
  final WorkoutEntity workouts4 = const WorkoutEntity(
    workoutCount: 100,
    workoutType: "Cardio",
    workoutImageUrl:
        "https://www.mensjournal.com/.image/t_share/MTk2MTM3MjczNzM4Mjc0MzA5/take-your-cardio-performance-to-the-next-level.jpg",
    workoutDetails: [
      WorkoutDetailEntity(
          workoutName: "Cardio",
          description:
              "Cardio is a type of exercise that gets your heart rate up and makes you breathe harder. It is a great way to keep your heart healthy and to burn calories.",
          videoUrl: "https://www.youtube.com/watch?v=IrA9dvgRKR0",
          kcal: "200",
          duration: "30",
          equipment: ["Treadmill", "Elliptical", "Stationary bike"]),
    ],
  );
  final WorkoutEntity workouts5 = const WorkoutEntity(
    workoutCount: 100,
    workoutType: "Cardio",
    workoutImageUrl:
        "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    workoutDetails: [
      WorkoutDetailEntity(
          workoutName: "Cardio",
          description:
              "Cardio is a type of exercise that gets your heart rate up and makes you breathe harder. It is a great way to keep your heart healthy and to burn calories.",
          videoUrl: "https://www.youtube.com/watch?v=IrA9dvgRKR0",
          kcal: "200",
          duration: "30",
          equipment: ["Treadmill", "Elliptical", "Stationary bike"]),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: workoutAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: CircularPercentIndicator(
                      radius: 70.r,
                      lineWidth: 13.0,
                      animation: true,
                      percent: 0.35,
                      center: Text(
                        "2 workouts",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.5.sp),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppColor.purplyBlue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Available Workouts',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: AppColor.black),
                ),
                // video preview
                WorkoutPreviewWidget(
                  workouts: workouts,
                ),
                WorkoutPreviewWidget(
                  workouts: workouts2,
                ),
                WorkoutPreviewWidget(
                  workouts: workouts3,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Completed Workouts',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: AppColor.black),
                ),
                WorkoutPreviewWidget(
                  workouts: workouts4,
                ),
                WorkoutPreviewWidget(
                  workouts: workouts5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar workoutAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColor.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'Workout Recommendation',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
      ),
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(
            color: AppColor.santaGrey.withOpacity(0.3),
            height: 2.0.h,
          )),
    );
  }
}
