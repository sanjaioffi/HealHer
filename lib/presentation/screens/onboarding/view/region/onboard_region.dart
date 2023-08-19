import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/model/onboarding_model.dart';
import 'package:heal_her/presentation/screens/onboarding/model/region_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/region/region_slide.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

class OnboardRegionScreen extends StatelessWidget {
  const OnboardRegionScreen({super.key});

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
              StepIndicator(step: stateTypeModel.stepCount),
              TopTile(tileContent: stateTypeModel.topTitleContent),
              const RegionSlide(),
              BottomTile(tileContent: stateTypeModel.bottomTileContent),
              const SizedBox(height: 50),
              ContinueElevatedButton(nextRoute: stateTypeModel.nextRoute),
            ],
          ),
        ),
      ),
    );
  }
}
