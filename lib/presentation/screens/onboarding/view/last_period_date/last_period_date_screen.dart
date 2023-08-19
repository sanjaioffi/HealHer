import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/last_period_date/last_period_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

class LastPeriodDateScreen extends StatefulWidget {
  const LastPeriodDateScreen({super.key});

  @override
  State<LastPeriodDateScreen> createState() => _LastPeriodDateScreenState();
}

class _LastPeriodDateScreenState extends State<LastPeriodDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 3),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StepIndicator(step: 3),
              TopTile(tileContent: "When was the last day of your period?"),
              LastPeriodDatePicker(),
              ContinueElevatedButton(nextRoute: '/height'),
            ],
          ),
        ),
      ),
    );
  }
}
