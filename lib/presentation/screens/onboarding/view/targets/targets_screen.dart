import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/model/targets_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/targets/custom_card.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

class TargetsScreen extends StatefulWidget {
  const TargetsScreen({super.key});
  @override
  State createState() => _TargetsScreenState();
}

class _TargetsScreenState extends State<TargetsScreen> {
  Set<int> selectedLevels = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildOnBoardNavBar(context, userTargetsModel.stepCount),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StepIndicator(step: userTargetsModel.stepCount),
                TopTile(tileContent: userTargetsModel.topTitleContent),
                CustomCard(
                  iconImage: 'assets/images/targets_images/food.png',
                  text: 'Weight loss',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? selectedLevels.add(1)
                        : selectedLevels.remove(1);
                  },
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/sleeping.png',
                  text: 'Better sleeping habit',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? selectedLevels.add(2)
                        : selectedLevels.remove(2);
                  },
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/nutirition.png',
                  text: 'Track my nutrition',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? selectedLevels.add(3)
                        : selectedLevels.remove(3);
                  },
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/muscle.png',
                  text: 'Improve overall fitness',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? selectedLevels.add(4)
                        : selectedLevels.remove(4);
                  },
                ),
                const SizedBox(height: 20),
                ContinueElevatedButton(nextRoute: userTargetsModel.nextRoute),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ));
  }
}
