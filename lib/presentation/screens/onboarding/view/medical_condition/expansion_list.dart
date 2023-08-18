import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/medical_condition/dynamic_chip.dart';

import '../../../../utils/app_colors.dart';

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

class ExpansionList extends StatelessWidget {
  const ExpansionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 35,
        bottom: 30,
      ),
      child: Column(
        children: [
          ExpansionTile(
            title: const Text("Heart Diseases"),
            textColor: AppColor.heavyPurplyBlue,
            children: [
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
            ],
          ),
          ExpansionTile(
            title: const Text("Lung Diseases"),
            textColor: AppColor.heavyPurplyBlue,
            children: [
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
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const Text("Physical Injuries"),
            textColor: AppColor.heavyPurplyBlue,
            children: [
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
            ],
          ),
        ],
      ),
    );
  }
}
