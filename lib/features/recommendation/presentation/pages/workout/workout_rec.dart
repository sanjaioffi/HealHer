import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/recommendation/domain/entities.dart';
import 'package:heal_her/features/recommendation/presentation/widgets/workout_appbar.dart';
import 'package:heal_her/features/recommendation/presentation/widgets/workout_pre.dart';

class WorkoutRecommendationPage extends StatelessWidget {
  const WorkoutRecommendationPage({super.key});
  static const w = WorkoutDetailEntity(
      workoutName: "Jumping Jacks  🦘",
      description:
          "Jumping jacks are a great total-body workout you can do at home. They increase your heart rate to help you burn fat and improve your cardiovascular fitness. They also help you warm up for other exercises or sports.",
      videoUrl:
          "https://player.vimeo.com/progressive_redirect/playback/907581242/rendition/360p/file.mp4?loc=external&oauth2_token_id=1747418641&signature=371b165bd4e058486034721b3150cbacbfd0e0e557c7abd1c7349f2941a21615",
      workoutSets: "3X5");
  final workout = const WorkoutEntity(
    workoutType: "Cardio",
    workoutLevel: "Intermediate",
    workoutItemCount: 10,
    workoutImageUrl:
        "https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    workoutDuration: 16,
    workoutDetails: [
      w,
      w,
      w,
      w,
      w,
      w,
      w,
      w,
      w,
      w,
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const WorkoutAppBar(),
            SizedBox(height: 10.h),
            Text("Practice",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 10.h),
            Column(
              children: [
                WorkoutPreviewWidget(workouts: workout),
                WorkoutPreviewWidget(workouts: workout),
                WorkoutPreviewWidget(workouts: workout),
                WorkoutPreviewWidget(workouts: workout),
                WorkoutPreviewWidget(workouts: workout),
                WorkoutPreviewWidget(workouts: workout),
                WorkoutPreviewWidget(workouts: workout),
                WorkoutPreviewWidget(workouts: workout),
                WorkoutPreviewWidget(workouts: workout),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
