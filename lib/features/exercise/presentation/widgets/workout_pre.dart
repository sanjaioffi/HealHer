// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:heal_her/features/exercise/presentation/widgets/rec_detail_page.dart';

// import '../../../../config/services/services.dart';
// import '../../../../config/theme/app_colors.dart';
// import '../../domain/entities/exercise.dart';
// import '../../domain/usecase/fetch_exercise_use_case.dart';

// class WorkoutPreviewWidget extends StatelessWidget {
//   const WorkoutPreviewWidget({
//     super.key,
//     required this.workouts,
//   });
//   final Exercise workouts;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         final r = await serviceLocator<FetchExerciseUseCase>()();

//         RecommendationDetailPage();

//         ///
//       },
//       child: Container(
//         height: 150.h,
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//         margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//         decoration: BoxDecoration(
//           color: AppColor.bluishCyanLight,
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text('55 Min',
//                     style: TextStyle(
//                       fontSize: 13.sp,
//                       fontWeight: FontWeight.w600,
//                     )),
//               ],
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         workouts.workoutName,
//                         style: TextStyle(
//                             fontSize: 16.sp, fontWeight: FontWeight.w700),
//                       ),
//                       // SizedBox(height: 5.h),
//                       Text(
//                         "Amateur Level",
//                         style: TextStyle(
//                             fontSize: 12.sp, fontWeight: FontWeight.w600),
//                       ),
//                       // SizedBox(height: 5.h),
//                       Text(
//                         "${workouts.workoutSets} Workouts",
//                         style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w600,
//                             color: AppColor.santaGrey.withOpacity(.4)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
