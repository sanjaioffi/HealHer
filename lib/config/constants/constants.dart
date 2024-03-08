import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/onboard/domain/entity/user_entity.dart';
import '../routes/route_names.dart';
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
  'Insomnia',
  'Depression',
  'Hypertension',
  'Thyroid',
  'Obesity',
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

const String userDietReference = "user_diet";

const String userExerciseReference = "user_exercises";

const String userHealthReference = "user_health";

const List<IconData> tileIconData = [
  Icons.sunny,
  Icons.cloud_outlined,
  Icons.nightlight_outlined
];

const List<MaterialColor> tileColorData = [
  Colors.amber,
  Colors.grey,
  Colors.blue,
];

const MONGO_PASS = "mohanasundharam";
const MONGO_USER = "mohanasundharam";
const MONGO_DATABASE = "HealHerDataBase";

const MONGO_URL =
    "mongodb+srv://$MONGO_USER:$MONGO_PASS@cluster0.vmuahl9.mongodb.net/$MONGO_DATABASE?retryWrites=true&w=majority&appName=Cluster0";

const List<String> recommendationTileStrings = [
  "Exercises",
  "Meditation",
  "Diet",
  "Ayurvedic",
  "Menstrual",
];

const List<String> recommendationTileSubStrings = [
  "Yoga, Cardio, Strength",
  "Mindfulness, Relaxation",
  "Nutrition, Recipes",
  "Herbs, Remedies",
  "Cycle, Periods",
];

const List<IconData> recommendationTileIcons = [
  Icons.extension,
  Icons.self_improvement,
  Icons.restaurant_menu,
  Icons.healing,
  Icons.wc,
];

const List<MaterialColor> recommendationTileColors = [
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.purple,
  Colors.pink,
];

List<String> recommendationAppRoutes = [
  AppRoute.exerciseRecommendationScreen,
  AppRoute.meditationScreen,
  AppRoute.foodRecommendationScreen,
  AppRoute.healthRecommendationScreen,
  AppRoute.foodRecommendationScreen,
];
