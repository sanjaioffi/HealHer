import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class LastPeriodDatePicker extends StatelessWidget {
  const LastPeriodDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight(40),
        bottom: screenHeight(20),
      ),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          controlsTextStyle: TextStyle(
            color: AppColor.black,
            fontSize: screenHeight(15),
            fontWeight: FontWeight.bold,
          ),
          weekdayLabelTextStyle: TextStyle(
            color: AppColor.black,
            fontSize: screenHeight(15),
            fontWeight: FontWeight.bold,
          ),
          yearTextStyle: TextStyle(
            color: AppColor.black,
            fontSize: screenHeight(15),
            fontWeight: FontWeight.bold,
          ),
          dayTextStyle: TextStyle(
            color: AppColor.black,
            fontSize: screenHeight(15),
            fontWeight: FontWeight.bold,
          ),
          currentDate: DateTime.now(),
          lastDate: DateTime.now(),
          selectedDayHighlightColor: AppColor.heavyPurplyBlue,
          calendarType: CalendarDatePicker2Type.single,
        ),
        value: const [],
      ),
    );
  }
}
