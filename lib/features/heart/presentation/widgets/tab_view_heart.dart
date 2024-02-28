import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/app_colors.dart';

import '../../../step/presentation/widgets/steps_insights.dart';
import 'back_ground.dart';
import 'date_container.dart';

class TabViewBarHeart extends StatelessWidget {
  TabViewBarHeart({super.key, required this.tabController});

  final TabController tabController;

  final textStyle1 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w600,
    fontSize: 16.h,
    wordSpacing: 2,
  );

  @override
  Widget build(BuildContext context) {
    /*
      NotificationListener is used to remove the scroll glow.

      */
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification notification) {
        notification.disallowIndicator();
        return true;
      },
      /*
      This TabView has Days,Week and Month Data.
       */
      child: Expanded(
        child: TabBarView(controller: tabController, children: [
          SingleChildScrollView(
            child: Column(
              children: [
                /*
                period changing button
                 */
                const DateContainer(
                  periodType: Period.day,
                ),
                graphBackGroundContainer(
                  child: innerGraphWidget(
                    text1: 'Average Heart Rate',
                    text2: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '34',
                            style: textStyle1,
                          ),
                          TextSpan(
                            text: ' : bpm',
                            style: textStyle1,
                          )
                        ],
                      ),
                    ),
                    periodType: Period.day,
                  ),
                ),
                const dayHeartRate(),
                const DisclaimerText()
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const DateContainer(
                  periodType: Period.week,
                ),
                graphBackGroundContainer(
                    child: innerGraphWidget(
                        text1: 'Weekly Data',
                        text2: Text(
                          "Heart Rate",
                          style: textStyle1,
                        ),
                        periodType: Period.week)),
                DoubleWeekData(weekData: weekHeartData, suffix: 'bpm'),
                const DisclaimerText()
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const DateContainer(
                  periodType: Period.month,
                ),
                graphBackGroundContainer(
                    child: innerGraphWidget(
                        text1: 'Monthly Data',
                        text2: Text(
                          "Heart Rate",
                          style: textStyle1,
                        ),
                        periodType: Period.month)),
                DoubleMonthData(monthData: monthHeartData, suffix: 'bpm'),
                const DisclaimerText(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
