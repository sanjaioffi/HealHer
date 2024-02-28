import 'package:flutter/material.dart';
import '../../../data/model/dual_choice_model.dart';
import 'food_slide.dart';

import '../generic/bottom_tile.dart';
import '../generic/continue_elevated_button.dart';
import '../generic/onboard_appbar.dart';
import '../generic/step_indicator.dart';
import '../generic/top_tile.dart';

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
              const ContinueElevatedButton(
                nextRoute: 'region',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
