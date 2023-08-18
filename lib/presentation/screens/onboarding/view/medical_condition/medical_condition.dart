import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/medical_condition/expansion_list.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

import 'dynamic_chip.dart';

class MedicalConditionScreen extends StatefulWidget {
  const MedicalConditionScreen({Key? key}) : super(key: key);

  @override
  State<MedicalConditionScreen> createState() => _MedicalConditionScreenState();
}

class _MedicalConditionScreenState extends State<MedicalConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 10),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  StepIndicator(step: 10),
                  TopTile(
                    tileContent:
                        'Any medical issues that we need to be aware of?',
                  ),
                  ExpansionList(),
                  ContinueElevatedButton(
                    nextRoute: 'profile',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
