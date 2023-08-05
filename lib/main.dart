import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/targets/targets_screen.dart';
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
      home: const TargetsScreen(),
    );
  }
}
