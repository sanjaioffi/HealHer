import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/constants/constants.dart';
import '../../../../../config/routes/route_names.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';

import '../../widgets/medical/dynamic_chip.dart';

class MedicalConditionScreen extends StatelessWidget {
  const MedicalConditionScreen({Key? key}) : super(key: key);

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
                    const StepIndicator(step: 6),

                    //
                    const TopTile(
                        tileContent:
                            'Any medical issues that we need to be aware of?'),

                    //
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Center(
                        child: Wrap(
                          spacing: 8.0, // spacing between chips
                          runSpacing: 8.0, // spacing between rows
                          children: activityOptions.map(
                            (chipText) {
                              return DynamicChip(
                                name: chipText,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),

                    //
                    Padding(
                      padding: EdgeInsets.only(top: 70.h),
                      child: ContinueElevatedButton(
                        nextRoute: AppRoute.onboardFitness,
                        canSwitch: true,
                        errorMessage: "",
                      ),
                    )

                    //
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
