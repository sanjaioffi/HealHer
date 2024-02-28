import 'package:flutter/material.dart';

import '../../widgets/generic/bottom_tile.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';
import '../../widgets/medical/dynamic_chip.dart';

class MedicalConditionScreen extends StatefulWidget {
  const MedicalConditionScreen({Key? key}) : super(key: key);

  @override
  State<MedicalConditionScreen> createState() => _MedicalConditionScreenState();
}

// list of string options
List<String> options = [
  'Diabetes',
  'Heart Patient',
  'Blood Pressure',
  'Cholesterol',
  'Stress',
  'Sleep issues',
  'Depression',
  'Anger issues',
  'Hypertension',
  'PCOS',
  'Thyroid',
  'Physical Injury',
  'Excessive stress/anxiety',
  'Lonliness',
  'Relationship stress',
];

class _MedicalConditionScreenState extends State<MedicalConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 10),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const StepIndicator(step: 10),
                  const TopTile(
                    tileContent:
                        'Any medical issues that we need to be aware of?',
                  ),
                  const BottomTile(
                      tileContent:
                          'Using this information, we can lead you safely and promptly to your fitness goal.'),
                  const Divider(),
                  Center(
                      child: Wrap(
                    spacing: 8.0, // spacing between chips
                    runSpacing: 8.0, // spacing between rows
                    children: options.map((chipText) {
                      return DynamicChip(
                        name: chipText,
                      );
                    }).toList(),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  const ContinueElevatedButton(
                    nextRoute: 'main',
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
