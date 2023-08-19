import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/model/height_model.dart';
import 'package:heal_her/presentation/screens/onboarding/model/userinfo_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/height/height_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import '../../../../common/screen_utils/screen_size.dart';

class OnBoardHeight extends StatefulWidget {
  const OnBoardHeight({super.key});

  @override
  State<OnBoardHeight> createState() => _OnBoardHeightState();
}

class _OnBoardHeightState extends State<OnBoardHeight> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context, userHeightModel.stepCount),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StepIndicator(step: userHeightModel.stepCount),
          TopTile(tileContent: userHeightModel.topTitleContent),
          SizedBox(
              height: screenHeight(280),
              child: Image.asset("assets/png/height.png")),
          const HeightPicker(),
          SizedBox(height: screenHeight(50)),
          ContinueElevatedButton(nextRoute: userHeightModel.nextRoute),
        ],
      ),
    );
  }
}
