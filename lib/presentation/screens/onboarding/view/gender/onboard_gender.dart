import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/gender/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/gender/gender_slide.dart';
import 'package:heal_her/presentation/screens/onboarding/view/gender/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/gender/step_indicator.dart';
import '../../../../utils/app_colors.dart';

class OnBoardGenderScreen extends StatelessWidget {
  const OnBoardGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepIndicator(step: 1),
              Text(
                "Which one are you?",
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              GenderSlide(),
              ContinueElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
