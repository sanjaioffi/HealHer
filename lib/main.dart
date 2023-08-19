import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/home/view/heart.dart';
import 'package:heal_her/theme/build_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealHer-SmartBand',
      theme: buildTheme(),
      home: Heart(),
    );
  }
}
