import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/onboarding/model/period_length_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/period_length/period_cycle_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class PeriodLengthScreen extends StatefulWidget {
  const PeriodLengthScreen({super.key});

  @override
  State<PeriodLengthScreen> createState() => _PeriodLengthScreenState();
}

class _PeriodLengthScreenState extends State<PeriodLengthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, periodCycleModel.stepCount),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StepIndicator(step: periodCycleModel.stepCount),
              TopTile(tileContent: periodCycleModel.topTitleContent),
              SizedBox(
                  height: screenHeight(200),
                  child: Image.asset('assets/images/onboard-period.png')),
              const PeriodCyclePicker(),
              ContinueElevatedButton(nextRoute: periodCycleModel.nextRoute),
            ],
          ),
        ),
      ),
    );
  }
}
