import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/screen_utils/screen_size.dart';
import '../../../../../utils/app_colors.dart';
import '../bar_chart_graph.dart';

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
    width: screenWidth(500),
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

Column innerGraphWidget({required String text1, required Widget text2,required Period periodType}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text1,
        style: TextStyle(color: Colors.grey[500], fontSize: screenHeight(12)),
      ),
      Row(
        children: [
          Container(
              height: screenHeight(28),
              width: screenWidth(28),
              margin: EdgeInsets.symmetric(vertical: screenWidth(10)),
              padding: EdgeInsets.all(screenWidth(4)),
              decoration: BoxDecoration(
                  color: AppColor.purplyBlue.withOpacity(.50),
                  borderRadius: BorderRadius.circular(screenWidth(9))),
              child: SvgPicture.asset(
                'assets/svg/heart.svg',
                fit: BoxFit.contain,
              )),
          SizedBox(
            width: screenWidth(5),
          ),
          text2
        ],
      ),
        Expanded(child: HeartBarChart(periodType:periodType))
    ],
  );
}
enum Period {
  day,
  week,
  month
}
