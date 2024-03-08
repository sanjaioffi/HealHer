import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/constants/constants.dart';
import '../../../../../core/config/routes/route_names.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';

class OnboardLastPeriodDateScreen extends StatefulWidget {
  const OnboardLastPeriodDateScreen({super.key});

  @override
  State<OnboardLastPeriodDateScreen> createState() =>
      _OnboardLastPeriodDateScreenState();
}

class _OnboardLastPeriodDateScreenState
    extends State<OnboardLastPeriodDateScreen> {
  //
  late List<DateTime> dateValues;

  //
  @override
  void initState() {
    dateValues = [];
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const StepIndicator(step: 5),

              //
              Padding(
                padding: EdgeInsets.all(8.0.h),
                child: const TopTile(
                    tileContent: "When was the last day of your period?"),
              ),

              //
              Padding(
                padding: EdgeInsets.only(top: 45.h),
                child: CalendarDatePicker2(
                  config: calenderConfig,
                  value: dateValues,
                  onValueChanged: (value) {
                    userEntity.lastPeriodDate = value[value.length - 1]!;
                    setState(() {
                      dateValues = [value[value.length - 1]!];
                    });
                  },
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(top: 75.h),
                child: ContinueElevatedButton(
                  nextRoute: AppRoute.onboardMedicalIssue,
                  canSwitch: userEntity.lastPeriodDate != DateTime(1900),
                  errorMessage: "Pick your last date of your period",
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
