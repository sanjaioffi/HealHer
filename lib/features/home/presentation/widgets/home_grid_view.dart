import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heal_her/features/blood_pressure/presentation/blood_pressure.dart';
import 'package:heal_her/features/heart/presentation/heart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../device/controller/data_controller.dart';
import '../../../device/controller/scan_controller.dart';
import 'home_data_tile.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({super.key});

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  final ScanController scanController = Get.find();

  final DataController dataController = Get.find();

  @override
  void initState() {
    dataController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: SizedBox(
            height: 320.h,
            child: GridView.extent(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                maxCrossAxisExtent: 200.0, // maximum item width
                mainAxisSpacing: 16.0, // spacing between rows
                crossAxisSpacing: 16.0, // spacing between columns
                padding: const EdgeInsets.all(8.0), // padding around the grid
                children: [
                  HomeDataTile(
                    isEnabled: true,
                    nextScreen: const Heart(),
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
                              text: TextSpan(
                                  text: dataController.heartRate.value,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: const [
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
                    isEnabled: false,
                    nextScreen: const Text('Spo2'),
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
                            '${dataController.spo2.value}%',
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
                    isEnabled: true,
                    nextScreen: const BloodPressure(),
                    backgroundColor: Colors.red.shade100,
                    title: 'Blood Pressure',
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
                              text: TextSpan(
                                  text:
                                      '${dataController.bpSys.value}/${dataController.bpDys.value}',
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: const [
                                TextSpan(
                                    text: ' mmHg',
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
                    isEnabled: false,
                    nextScreen: const Text('Steps'),
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
        ));
  }
}
