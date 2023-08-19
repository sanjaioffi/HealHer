import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/model/userinfo_model.dart';
import 'package:heal_her/presentation/screens/onboarding/model/weight_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/weight/weight_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import '../../../../common/screen_utils/screen_size.dart';

class OnboardWeight extends StatefulWidget {
  const OnboardWeight({super.key});

  @override
  State<OnboardWeight> createState() => _OnboardWeightState();
}

class _OnboardWeightState extends State<OnboardWeight> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context, weightModel.stepCount),
      body: Column(
        children: [
          StepIndicator(step: weightModel.stepCount),
          TopTile(tileContent: weightModel.topTitleContent),
          SizedBox(
            height: screenHeight(250),
            child: const Placeholder(),
          ),
          const WeightPicker(),
          ContinueElevatedButton(nextRoute: weightModel.nextRoute),
        ],
      ),
    );
  }
}
