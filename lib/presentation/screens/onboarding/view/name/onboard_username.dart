import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/name/name_field.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import '../../../../common/screen_utils/screen_size.dart';

class OnBoardingNameScreen extends StatelessWidget {
  const OnBoardingNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StepIndicator(step: 1),
            const TopTile(tileContent: "Share your name with us !"),
            Image.asset(
              "assets/images/dob.png",
              height: screenHeight(250),
              width: screenWidth(250),
            ),
            const NameField(),
            SizedBox(
              height: screenHeight(14),
            ),
            const BottomTile(
              tileContent:
                  "Tell us your name to share wit us to better communicate",
            ),
            SizedBox(
              height: screenHeight(50),
            ),
            const ContinueElevatedButton(
              nextRoute: '/dob',
            ),
          ],
        ),
      ),
    );
  }
}
