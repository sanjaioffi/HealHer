import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'package:heal_her/features/recommendation/domain/entities.dart';
import 'package:heal_her/features/recommendation/presentation/widgets/video_player.dart';

class RecommendationDetailPage extends StatelessWidget {
  RecommendationDetailPage({super.key});

  final List<WorkoutDetailEntity> workout = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          title: Text('Workouts',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w600)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.5.h,
            ),
          ),
          titleSpacing: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // frame with player
              Container(
                margin: EdgeInsets.all(10.sp),
                height: 180.h,
                width: double.infinity,
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColor.santaGrey.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
                child: const VideoPlayerWidget(
                    videoUrl:
                        'https://cdn.pixabay.com/vimeo/563974349/treadmill-77916.mp4?width=640&hash=c2faefbcc7a16350715a4b505dad4397d4627314'),
              ),
              Text(
                workout[0].workoutName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.sp),
                    decoration: BoxDecoration(
                      color: AppColor.santaGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.av_timer_outlined),
                        Text('${workout[0].duration} mins')
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    padding: EdgeInsets.all(6.sp),
                    decoration: BoxDecoration(
                      color: AppColor.santaGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.local_fire_department_outlined),
                        Text('${workout[0].kcal} kcal')
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                workout[0].description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.purplyBlue,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Start Workout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Text("Next Workouts",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
