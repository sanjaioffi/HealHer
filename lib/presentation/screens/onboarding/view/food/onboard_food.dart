import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/model/dual_choice_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/food/food_slide.dart';
import 'package:heal_her/presentation/screens/onboarding/view/region/onboard_region.dart';

import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

class OnboardFoodScreen extends StatelessWidget {
  const OnboardFoodScreen({super.key});

  static DualChoiceModel foodModel = foodTypeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 6),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepIndicator(step: foodModel.stepCount),
              TopTile(tileContent: foodModel.topTitleContent),
              const FoodSlide(),
              BottomTile(tileContent: foodModel.bottomTileContent),
              const SizedBox(
                height: 50,
              ),
              const ContinueElevatedButton(nextRoute: 'region',),
            ],
          ),
        ),
      ),
    );
  }
}
