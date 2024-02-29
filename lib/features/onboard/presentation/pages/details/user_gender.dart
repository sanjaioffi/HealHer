import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heal_her/features/onboard/presentation/controller/gender_controller.dart';
import 'package:heal_her/features/onboard/data/model/dual_choice_model.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/bottom_tile.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/gender/gender_slide.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/step_indicator.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/top_tile.dart';

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

              //
              TopTile(tileContent: genderModel.topTitleContent),

              //
              const GenderSlide(),

              //
              Padding(
                padding: EdgeInsets.only(bottom: 50.h, top: 10.h),
                child: BottomTile(tileContent: genderModel.bottomTileContent),
              ),

              //
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
