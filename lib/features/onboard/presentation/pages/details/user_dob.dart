import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/dob/dob_col.dart';
import '../../widgets/generic/bottom_tile.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';

class OnBoardingDobScreen extends StatefulWidget {
  const OnBoardingDobScreen({super.key});

  @override
  State<OnBoardingDobScreen> createState() => _OnBoardingDobScreenState();
}

class _OnBoardingDobScreenState extends State<OnBoardingDobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const StepIndicator(step: 2),

              //
              const TopTile(tileContent: "What is your Date of Birth ?"),

              //
              Image.asset(
                "assets/images/dob.png",
                height: 250.h,
                width: 250.w,
              ),

              //
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const BottomTile(
                  tileContent:
                      "To give personalised food diet plans. Please share your Date of Birth",
                ),
              ),

              const DobCol(),

              //
            ],
          ),
        ),
      ),
    );
  }
}
