import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuggestionsTile extends StatelessWidget {
  const SuggestionsTile({
    super.key,
    required this.title,
    required this.tileIcon,
    required this.tileColor,
    required this.tileSubStrings,
    required this.appRoute,
  });

  final String title;
  final IconData tileIcon;
  final MaterialColor tileColor;
  final String tileSubStrings;
  final String appRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            tileIcon,
            color: tileColor,
            size: 50.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),

          //

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              tileSubStrings,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
          ),

          IconButton(
            onPressed: () {
              Get.toNamed(appRoute);
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
            ),
          )
        ],
      ),
    );
  }
}
