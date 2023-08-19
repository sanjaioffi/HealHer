import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';
import 'back_ground.dart';
import 'date_container.dart';

class TabViewBarHeart extends StatelessWidget {
   TabViewBarHeart(
      {super.key, required this.tabController, required this.days});

  final TabController tabController;
  final List<DateTime> days;

  var textStyle1=TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w600,fontSize: screenHeight(16),
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
          Column(
            children: [
              DateContainer(
                days: days,
              ),
              graphBackGroundContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Average Heart Rate',
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: screenHeight(12)),
                  ),
                  Row(
                    children: [
                      Container(
                          height: screenHeight(28),
                          width: screenWidth(28),
                          margin:
                              EdgeInsets.symmetric(vertical: screenWidth(10)),
                          padding: EdgeInsets.all(screenWidth(4)),
                          decoration: BoxDecoration(
                              color: AppColor.purplyBlue.withOpacity(.50),
                              borderRadius:
                                  BorderRadius.circular(screenWidth(9))),
                          child: SvgPicture.asset(
                            'assets/svg/heart.svg',
                            fit: BoxFit.contain,
                          )),
                      SizedBox(width: screenWidth(5),),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '34',
                              style:textStyle1,
                            ),
                            TextSpan(
                                text: ' : bpm',
                                style:textStyle1,
                            )],
                        ),
                      )
                    ],
                  )
                ],
              ))
            ],
          ),
          Column(
            children: [
              DateContainer(
                days: days,
              ),
              graphBackGroundContainer(child: SizedBox())
            ],
          ),
          Column(
            children: [
              DateContainer(
                days: days,
              ),
              graphBackGroundContainer(child: SizedBox())
            ],
          ),
        ]),
      ),
    );
  }
}
