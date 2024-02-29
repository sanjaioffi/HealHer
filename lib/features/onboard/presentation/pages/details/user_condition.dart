import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/step_indicator.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/top_tile.dart';

import '../../widgets/medical/dynamic_chip.dart';

class MedicalConditionScreen extends StatefulWidget {
  const MedicalConditionScreen({Key? key}) : super(key: key);

  @override
  State<MedicalConditionScreen> createState() => _MedicalConditionScreenState();
}

class _MedicalConditionScreenState extends State<MedicalConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const StepIndicator(step: 10),
                    const TopTile(
                        tileContent:
                            'Any medical issues that we need to be aware of?'),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Center(
                          child: Wrap(
                        spacing: 8.0, // spacing between chips
                        runSpacing: 8.0, // spacing between rows
                        children: activityOptions.map((chipText) {
                          return DynamicChip(
                            name: chipText,
                          );
                        }).toList(),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70.h),
                      child: const ContinueElevatedButton(
                        nextRoute: '/activities',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
