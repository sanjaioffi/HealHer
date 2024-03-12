import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/app_colors.dart';
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
                  child: const Column(
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
        ],
      ),
    );
  }
}
