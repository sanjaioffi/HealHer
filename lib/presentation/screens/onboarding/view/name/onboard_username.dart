import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/model/username_model.dart';
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
    return Scaffold(
      appBar: buildOnBoardNavBar(context, userNameModel.stepCount),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StepIndicator(step: userNameModel.stepCount),
            TopTile(tileContent: userNameModel.topTitleContent),
            Image.asset("assets/images/dob.png",
                height: screenHeight(250), width: screenWidth(250)),
            const NameField(),
            SizedBox(height: screenHeight(14)),
            BottomTile(tileContent: userNameModel.bottomTileContent),
            SizedBox(height: screenHeight(50)),
            ContinueElevatedButton(nextRoute: userNameModel.nextRoute),
          ],
        ),
      ),
    );
  }
}
