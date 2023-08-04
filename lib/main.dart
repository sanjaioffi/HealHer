import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/activities/activities_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/last_period_date/last_period_date_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/medical_condition/medical_condition.dart';
import 'package:heal_her/presentation/screens/onboarding/view/period_length/period_length_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/region/onboard_region.dart';
import 'package:heal_her/presentation/screens/onboarding/view/targets/targets_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/welcome/welcome_screen.dart';
import 'package:heal_her/theme/build_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealHer-SmartBand',
      theme: buildTheme(),
      home: LastPeriodDateScreen(),
    );
  }
}
