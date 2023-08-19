import 'package:flutter/material.dart';
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
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth(55), vertical: screenHeight(20)),
              height: screenHeight(55),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(25),
                vertical: screenHeight(2),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(screenHeight(45))),
              child: TextField(
                autofocus: true,
                style: TextStyle(
                  fontSize: screenHeight(17),
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade800,
                ),
                decoration: const InputDecoration(
                  hintText: "Enter Your Name",
                  border: InputBorder.none,
                ),
              ),
            ),
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
