import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';
import '../../../../../config/theme/app_colors.dart';

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
              // SizedBox(
              //     height: 250,
              //     child: Image.asset('assets/images/onboard-period_date.png')),
              const TopTile(
                  tileContent: "When was the last day of your period?"),
              const SizedBox(
                height: 50,
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  controlsTextStyle: const TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  weekdayLabelTextStyle: const TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  yearTextStyle: const TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  dayTextStyle: const TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
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
              const SizedBox(
                height: 10,
              ),
              const ContinueElevatedButton(
                nextRoute: '/height',
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
