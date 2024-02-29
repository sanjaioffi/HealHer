import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/presentation/widgets/dob/dob_tile.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/bottom_tile.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/step_indicator.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/top_tile.dart';

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
              const TopTile(tileContent: "What is your Date of Birth ?"),
              Image.asset(
                "assets/images/dob.png",
                height: 250.h,
                width: 250.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const BottomTile(
                  tileContent:
                      "To give personalised food diet plans. Please share your Date of Birth",
                ),
              ),
              const DobSelector(),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: const ContinueElevatedButton(
                  nextRoute: '/gender',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
