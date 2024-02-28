import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/presentation/widgets/dob/dob_tile.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/bottom_tile.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/step_indicator.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/top_tile.dart';
import '../../../../../config/theme/screen_size.dart';

class OnBoardingDobScreen extends StatefulWidget {
  const OnBoardingDobScreen({super.key});

  @override
  State<OnBoardingDobScreen> createState() => _OnBoardingDobScreenState();
}

class _OnBoardingDobScreenState extends State<OnBoardingDobScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 2),
      body: SafeArea(
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
            SizedBox(height: 30.h),
            const BottomTile(
              tileContent:
                  "To give personalised food diet plans. Please share your Date of Birth",
            ),
            const DobSelector(),
            SizedBox(height: 30.h),
            const ContinueElevatedButton(
              nextRoute: '/gender',
            ),
          ],
        ),
      ),
    );
  }
}
