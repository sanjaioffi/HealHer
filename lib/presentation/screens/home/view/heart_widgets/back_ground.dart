import 'package:flutter/material.dart';

import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';

Container backGroundContainer(
    {required Widget child, required double horizontal, required double vertical, required double height, required double width}) {
  return Container(
    height: height,
    width: width,
    margin: EdgeInsets.all(screenWidth(15)),
    padding: EdgeInsets.symmetric(horizontal: horizontal,vertical: vertical),
    decoration: BoxDecoration(
      color: AppColor.lightPurplrBlue,
      borderRadius: BorderRadius.circular(screenWidth(50)),
      border: Border.all(color: Colors.grey.shade300,width: 1.5),
    ),
    child: child,
  );
}

Container graphBackGroundContainer({required Widget child}){
  return Container(
    height: screenHeight(300),
    width: screenWidth(450),
    margin: EdgeInsets.all(screenWidth(15)),
    padding: EdgeInsets.all(screenWidth(20)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(screenWidth(25)),
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
