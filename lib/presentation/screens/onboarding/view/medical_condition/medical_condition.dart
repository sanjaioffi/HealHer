import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

import '../../controller/medical_condition_controller.dart';

class MedicalConditionScreen extends StatefulWidget {
  const MedicalConditionScreen({Key? key}) : super(key: key);

  @override
  State<MedicalConditionScreen> createState() => _MedicalConditionScreenState();
}

List<String> tags = [];

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
                  const Text(
                    'Any medical issues that we need to be aware of?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      'Using this information, we can lead you safely and promptly to your fitness goal.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      )),
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
                  const ContinueElevatedButton()
                  //ElevatedButton(onPressed: () {}, child: const Text('Next')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DynamicChip extends StatefulWidget {
  final String name;

  const DynamicChip({super.key, required this.name});

  @override
  _DynamicChipState createState() => _DynamicChipState();
}

class _DynamicChipState extends State<DynamicChip> {
  bool isImage1Visible = false;
  final MedicalIssuesController medicalIssuesController =
      Get.put(MedicalIssuesController());

  void _toggleColor() {
    medicalIssuesController.addMedicalIssue(widget.name);
    if (tags.contains(widget.name)) {
      tags.remove(widget.name);
    } else {
      tags.add(widget.name);
    }
    setState(() {
      isImage1Visible = !isImage1Visible;
    });

    // print(tags);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleColor,
      child: Chip(
          shadowColor: AppColor.heavyPurplyBlue,
          elevation: 2,
          label: Text(widget.name),
          backgroundColor:
              isImage1Visible ? AppColor.purplyBlue : AppColor.white,
          avatar: isImage1Visible ? const Icon(Icons.check) : null),
    );
  }
}
