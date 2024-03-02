import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/gender_controller.dart';
import '../../../domain/model/dual_choice_model.dart';
import '../../widgets/generic/bottom_tile.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/gender/gender_slide.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';

class OnBoardGenderScreen extends StatelessWidget {
  const OnBoardGenderScreen({super.key});

  static DualChoiceModel genderModel = genderTypeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 3),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepIndicator(step: genderModel.stepCount),
              TopTile(tileContent: genderModel.topTitleContent),
              const GenderSlide(),
              BottomTile(tileContent: genderModel.bottomTileContent),
              const SizedBox(
                height: 50,
              ),
              GetX<GenderController>(builder: (controller) {
                return ContinueElevatedButton(
                  nextRoute:
                      controller.isMale.value ? '/height' : '/period_length',
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
