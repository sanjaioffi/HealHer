import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../config/routes/route_names.dart';
import '../../controller/gender_controller.dart';
import '../../../data/model/dual_choice_model.dart';
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
      appBar: buildOnBoardNavBar(context, 5),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const StepIndicator(step: 5),

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
                  nextRoute: controller.isMale.value
                      ? AppRoute.onboardMedicalIssue
                      : AppRoute.onboardPeriodLength,
                  canSwitch: true,
                  errorMessage: "",
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
