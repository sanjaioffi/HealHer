import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class LastPeriodDateScreen extends StatefulWidget {
  const LastPeriodDateScreen({super.key});

  @override
  State<LastPeriodDateScreen> createState() => _LastPeriodDateScreenState();
}

class _LastPeriodDateScreenState extends State<LastPeriodDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StepIndicator(step: 7),
              // SizedBox(
              //     height: 250,
              //     child: Image.asset('assets/images/onboard-period_date.png')),
              SizedBox(
                width: 350,
                child: Text(
                  "When was the last day of your period?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  controlsTextStyle: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  weekdayLabelTextStyle: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  yearTextStyle: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  dayTextStyle: TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  currentDate: DateTime.now(),
                  lastDate: DateTime.now(),
                  selectedDayHighlightColor: AppColor.heavyPurplyBlue,
                  calendarType: CalendarDatePicker2Type.single,
                ),
                value: [],
                // onValueChanged: (dates) => [] = dates,
              ),
              SizedBox(
                height: 10,
              ),
              ContinueElevatedButton(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
