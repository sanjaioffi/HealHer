import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/activities_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/last_period_date_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/medical_condition.dart';
import 'package:heal_her/presentation/screens/onboarding/view/period_length_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/targets_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/welcome_screen.dart';

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
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: LastPeriodDateScreen(),
    );
  }
}
