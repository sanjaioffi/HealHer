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
            Text("Today Practice",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 10.h),
            const Column(
              children: [
                WorkoutPreviewWidget(workouts: w),
                WorkoutPreviewWidget(workouts: w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
