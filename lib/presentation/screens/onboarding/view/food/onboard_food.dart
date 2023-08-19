import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/model/food_type_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/food/food_slide.dart';

import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

class OnboardFoodScreen extends StatelessWidget {
  const OnboardFoodScreen({super.key});

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
              StepIndicator(step: foodTypeModel.stepCount),
              TopTile(tileContent: foodTypeModel.topTitleContent),
              const FoodSlide(),
              BottomTile(tileContent: foodTypeModel.bottomTileContent),
              const SizedBox(height: 50),
              ContinueElevatedButton(nextRoute: foodTypeModel.nextRoute),
            ],
          ),
        ),
      ),
    );
  }
}
