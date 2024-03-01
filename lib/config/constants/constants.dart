import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/domain/entity/user_entity.dart';

import '../theme/app_colors.dart';

final textStyle1 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.w600,
    fontSize: 16.h,
    wordSpacing: 2,
  );


List<String> activityOptions = [
  'Diabetes',
  'Heart Patient',
  'Blood Pressure',
  'Cholesterol',
  'Stress',
  'Sleep issues',
  'Depression',
  'Anger issues',
  'Hypertension',
  'PCOS',
  'Thyroid',
  'Physical Injury',
  'Excessive stress/anxiety',
  'Lonliness',
  'Relationship stress',
];

DateTime checkTime = DateTime(1900);

CalendarDatePicker2Config calenderConfig = CalendarDatePicker2Config(
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
);

UserEntity userEntity = UserEntity();

const String userBoxReference = "user_details";

const String userDataReference = "user_data";
