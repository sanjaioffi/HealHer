import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/routes/route_names.dart';
import '../../../../../config/services/services.dart';
import '../../controller/onboard_data_controller.dart';
import '../../widgets/generic/bottom_tile.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';

class OnboardStepsCompleteScreen extends StatelessWidget {
  const OnboardStepsCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(serviceLocator<OnboardDataController>());

    //
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 7),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const StepIndicator(step: 7),

              //
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                child: const TopTile(tileContent: "All Set & Redy to Go !"),
              ),

              //
              Image.asset('assets/images/welcome.png'),

              const BottomTile(
                  tileContent:
                      ' Empowering Women\'s Safety & overall Wellness with HealHer SmartBand.'),

              //
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: GetBuilder<OnboardDataController>(
                  builder: (controller) {
                    return ContinueElevatedButton(
                      nextRoute: AppRoute.homeScreen,
                      canSwitch: true,
                      errorMessage: "",
                      buttonText: "Get Started",
                    );

                    //
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
