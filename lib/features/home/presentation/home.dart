import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_colors.dart';
import '../../device/controller/data_controller.dart';
import '../../device/presentation/ecg.dart';
import 'widgets/home_grid_view.dart';
import 'widgets/home_stats.dart';
import 'widgets/home_topbar.dart';
import 'widgets/step_progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            //
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.56,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.heavyPurplyBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 45.h,
                  ),
                  child: Column(
                    children: [
                      HomeAppBar(),
                      HomeStepsIndicator(),
                      HomeHealthStat(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const HomeGridView(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.find<DataController>().sendCommand('ecg');
                Get.snackbar('Measuring ECG', 'Requesting Data...');
                Get.to(() => ECGGraph());
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ECG',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Measure ECG',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                height: 100.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.steps,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
