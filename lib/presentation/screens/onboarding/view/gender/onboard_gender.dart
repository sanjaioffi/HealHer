import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/screens/onboarding/controller/gender_controller.dart';
import 'package:heal_her/presentation/screens/onboarding/model/dual_choice_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/gender/gender_slide.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

class OnBoardGenderScreen extends StatelessWidget {
  const OnBoardGenderScreen({super.key});

  static DualChoiceModel genderModel = genderTypeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 3),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepIndicator(step: genderModel.stepCount),
              TopTile(tileContent: genderModel.topTitleContent),
              const GenderSlide(),
              BottomTile(tileContent: genderModel.bottomTileContent),
              const SizedBox(
                height: 50,
              ),
              GetX<GenderController>(builder: (controller) {
                print("The routed route ${controller.isMale.value}");
                return ContinueElevatedButton(
                  nextRoute: controller.isMale.value
                      ? '/height'
                      : '/period_length',
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
