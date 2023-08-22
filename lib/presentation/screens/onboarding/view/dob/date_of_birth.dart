import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/dob/dob_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import '../../../../common/screen_utils/screen_size.dart';

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
              height: screenHeight(250),
              width: screenWidth(250),
            ),
            SizedBox(height: screenHeight(30)),
            const BottomTile(
              tileContent:
                  "To give personalised food diet plans. Please share your Date of Birth",
            ),
            const DobSelector(),
            SizedBox(height: screenHeight(30)),
            const ContinueElevatedButton(
              nextRoute: '/gender',
            ),
          ],
        ),
      ),
    );
  }
}
