import 'package:flutter/material.dart';
import '../../../domain/model/dual_choice_model.dart';
import '../../widgets/choice/region_slide.dart';
import '../../widgets/generic/bottom_tile.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';

class OnboardRegionScreen extends StatelessWidget {
  const OnboardRegionScreen({super.key});

  static DualChoiceModel regionModel = stateTypeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 7),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepIndicator(step: regionModel.stepCount),
              TopTile(tileContent: regionModel.topTitleContent),
              const RegionSlide(),
              BottomTile(tileContent: regionModel.bottomTileContent),
              const SizedBox(
                height: 50,
              ),
              const ContinueElevatedButton(
                nextRoute: '/targets',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
