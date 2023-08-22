import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/medical_condition/dynamic_chip.dart';

class DiseaseClassifictions extends StatefulWidget {
  const DiseaseClassifictions({
    super.key,
  });

  @override
  State<DiseaseClassifictions> createState() => _DiseaseClassifictionsState();
}

class _DiseaseClassifictionsState extends State<DiseaseClassifictions> {
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

  List<String> issueClassifications = [
    "Heart Diseases",
    "Lung Diseases",
    "Stomach Issues",
    "Menstural Issues",
    "Physical Injuries",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          for (int i = 0; i < issueClassifications.length; i++)
            ExpansionTile(
              textColor: Colors.black,
              title: Text(
                issueClassifications[i],
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
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
