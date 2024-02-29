import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/app_colors.dart';

AppBar buildOnBoardNavBar(BuildContext context, int index) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_left_sharp,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: SizedBox(
      width: double.maxFinite,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: LinearProgressIndicator(
          minHeight: 7,
          backgroundColor: AppColor.babyPurplyBlue,
          color: AppColor.heavyPurplyBlue,
          value: index / 7,
        ),
      ),
    ),
    actions: [
      SizedBox(width: 50.w),
    ],
    centerTitle: true,
  );
}
