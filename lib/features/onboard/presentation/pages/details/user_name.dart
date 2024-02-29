import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';
import '../../widgets/name/name_col.dart';

class OnBoardingNameScreen extends StatelessWidget {
  const OnBoardingNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StepIndicator(step: 1),
            const TopTile(tileContent: "Share your name with us !"),
            Image.asset("assets/png/happy.png", height: 200.h),
            const NameCol(),
          ],
        ),
      ),
    );
  }
}
