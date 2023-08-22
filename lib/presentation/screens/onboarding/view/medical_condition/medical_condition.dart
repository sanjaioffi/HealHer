import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/model/user_medical_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/medical_condition/disease_list.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

class MedicalConditionScreen extends StatelessWidget {
  const MedicalConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, userMedicalIssueModel.stepCount),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  StepIndicator(step: userMedicalIssueModel.stepCount),
                  TopTile(tileContent: userMedicalIssueModel.topTitleContent),
                  const DiseaseClassifictions(),
                  BottomTile(
                      tileContent: userMedicalIssueModel.bottomTileContent),
                  const ContinueElevatedButton(nextRoute: 'profile')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
