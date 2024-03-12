import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../device/controller/data_controller.dart';
import '../../../device/presentation/ecg.dart';

class HomeStepsIndicator extends StatelessWidget {
  const HomeStepsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: InkWell(
        onTap: () {
          Get.dialog(
            AlertDialog(
              title: Text("ECG Instructions"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                      "Before taking ECG reading, please follow these instructions:"),
                  SizedBox(height: 10),
                  Text("- Place your finger on the plate near the display."),
                  Text(
                      "- Ensure that your finger is in proper contact with the plate."),
                  Text(
                      "- Relax and try to keep your finger still during the reading."),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.find<DataController>().sendCommand('ecg');
                    Get.snackbar('Measuring ECG', 'Requesting Data...');
                    Get.to(() => ECGGraph());
                  },
                  child:
                      Text('Start ECG', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        },
        child: CircularPercentIndicator(
          center: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(
                //   Icons.directions_walk_rounded,
                //   size: 50.sp,
                //   color: AppColor.white,
                // ),
                const Text("ECG",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    )),
                const Text(
                  'Measure your ECG',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ],
            ),
          ),
          radius: 110.0,
          animation: true,
          animationDuration: 1000,
          lineWidth: 15.0,
          percent: 0.9,
          reverse: false,
          arcType: ArcType.FULL,
          startAngle: 0.0,
          animateFromLastPercent: true,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: AppColor.lightPurplrBlue,
          progressColor: AppColor.purplyBlue,
          arcBackgroundColor: AppColor.lightPurplrBlue,
        ),
      ),
    );
  }
}
