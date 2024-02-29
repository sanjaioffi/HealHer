import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/step_indicator.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/top_tile.dart';
import 'package:heal_her/config/theme/app_colors.dart';

class OnboardLastPeriodDateScreen extends StatefulWidget {
  const OnboardLastPeriodDateScreen({super.key});

  @override
  State<OnboardLastPeriodDateScreen> createState() =>
      _OnboardLastPeriodDateScreenState();
}

class _OnboardLastPeriodDateScreenState
    extends State<OnboardLastPeriodDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const StepIndicator(step: 3),

              //
              Padding(
                padding: EdgeInsets.all(8.0.h),
                child: const TopTile(
                    tileContent: "When was the last day of your period?"),
              ),

              //
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    controlsTextStyle: TextStyle(
                      color: AppColor.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    weekdayLabelTextStyle: TextStyle(
                      color: AppColor.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    yearTextStyle: TextStyle(
                      color: AppColor.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    dayTextStyle: TextStyle(
                      color: AppColor.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    currentDate: DateTime.now(),
                    lastDate: DateTime.now(),
                    selectedDayHighlightColor: AppColor.heavyPurplyBlue,
                    calendarType: CalendarDatePicker2Type.single,
                  ),
                  value: const [],
                  // onValueChanged: (dates) => [] = dates,
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(top: 75.h),
                child: const ContinueElevatedButton(
                  nextRoute: '/height',
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
