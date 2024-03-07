import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../config/theme/app_colors.dart';
import 'home_data_tile.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: SizedBox(
        height: 380.h,
        child: GridView.extent(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            maxCrossAxisExtent: 200.0, // maximum item width
            mainAxisSpacing: 16.0, // spacing between rows
            crossAxisSpacing: 16.0, // spacing between columns
            padding: const EdgeInsets.all(8.0), // padding around the grid
            children: [
              HomeDataTile(
                backgroundColor: AppColor.spo2,
                title: 'Spo2',
                body: CircularPercentIndicator(
                  lineWidth: 7.0,
                  radius: 50.r,
                  percent: 0.7,
                  progressColor: AppColor.spo2Indicator,
                  backgroundColor: AppColor.spo2Indicator.withOpacity(0.2),
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '90%',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              HomeDataTile(
                backgroundColor: AppColor.heart,
                title: 'Heart Rate',
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/png/heart_rate.png',
                      color: AppColor.heavyPurplyBlue,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 170,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: const TextSpan(
                              text: '120',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: ' bpm',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black54))
                          ])),
                    ),
                  ],
                ),
              ),
              HomeDataTile(
                backgroundColor: AppColor.heart,
                title: 'Heart Rate',
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/png/heart_rate.png',
                      color: AppColor.heavyPurplyBlue,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 170,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: const TextSpan(
                              text: '120',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text: ' bpm',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.black54))
                          ])),
                    ),
                  ],
                ),
              ),
              HomeDataTile(
                backgroundColor: AppColor.steps,
                title: 'Steps',
                body: CircularPercentIndicator(
                  lineWidth: 7.0,
                  radius: 50,
                  percent: 0.7,
                  progressColor: AppColor.stepsIndicator,
                  backgroundColor: AppColor.stepsIndicator.withOpacity(0.2),
                  center: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('1234',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Steps', style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
              ),
              // HomeDataTile(),
              // HomeDataTile(),
            ]),
      ),
    );
  }
}
