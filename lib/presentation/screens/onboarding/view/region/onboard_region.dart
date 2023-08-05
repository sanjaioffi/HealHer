import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/model/dual_choice_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/region/region_slide.dart';

import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

class OnboardRegionScreen extends StatelessWidget {
  const OnboardRegionScreen({super.key});

  static DualChoiceModel regionModel = stateTypeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 7),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepIndicator(step: regionModel.stepCount),
              TopTile(tileContent: regionModel.topTitleContent),
              const RegionSlide(),
              BottomTile(tileContent: regionModel.bottomTileContent),
              const SizedBox(
                height: 50,
              ),
              const ContinueElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
