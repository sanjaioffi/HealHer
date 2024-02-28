import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/dob_tile.dart';
import 'package:heal_her/features/onboard/presntation/widgets/bottom_tile.dart';
import 'package:heal_her/features/onboard/presntation/widgets/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presntation/widgets/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presntation/widgets/step_indicator.dart';
import 'package:heal_her/features/onboard/presntation/widgets/top_tile.dart';
import '../../../../../config/theme/screen_size.dart';

class OnBoardingDOB extends StatefulWidget {
  const OnBoardingDOB({super.key});

  @override
  State<OnBoardingDOB> createState() => _OnBoardingDOBState();
}

class _OnBoardingDOBState extends State<OnBoardingDOB> {
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
