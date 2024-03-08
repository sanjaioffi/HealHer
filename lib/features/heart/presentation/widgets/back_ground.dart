import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/theme/app_colors.dart';
import 'bar_chart_graph.dart';

Container backGroundContainer(
    {required Widget child,
    required double horizontal,
    required double vertical,
    required double height,
    required double width}) {
  return Container(
    height: height,
    width: width,
    margin: EdgeInsets.all(15.w),
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    decoration: BoxDecoration(
      color: AppColor.lightPurplrBlue,
      borderRadius: BorderRadius.circular(50.r),
      border: Border.all(color: Colors.grey.shade300, width: 1.5),
    ),
    child: child,
  );
}

Container graphBackGroundContainer({required Widget child}) {
  return Container(
    height: 300.h,
    width: 500.w,
    margin: EdgeInsets.all(15.w),
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.r),
      border: Border.all(color: Colors.grey.shade300, width: 1.5),
      gradient: const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.centerRight,
        colors: [AppColor.lightPurplrBlue, Colors.white60],
      ),
    ),
    child: child,
  );
}

Column innerGraphWidget(
    {required String text1,
    required Widget text2,
    required Period periodType,
    required List<int> data}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text1,
        style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
      ),
      Row(
        children: [
          Container(
              height: 28.h,
              width: 28.h,
              margin: EdgeInsets.symmetric(vertical: 10.w),
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                  color: AppColor.purplyBlue.withOpacity(.50),
                  borderRadius: BorderRadius.circular(9.w)),
              child: SvgPicture.asset(
                'assets/svg/heart.svg',
                fit: BoxFit.contain,
              )),
          SizedBox(
            width: 5.w,
          ),
          text2
        ],
      ),
      Expanded(
          child: HeartBarChart(
        periodType: periodType,
        data: data,
      ))
    ],
  );
}

enum Period { day, week, month }
