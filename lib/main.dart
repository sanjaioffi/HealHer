import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/utils/routes.dart';
import 'package:heal_her/theme/build_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
      getPages: routes,
      debugShowCheckedModeBanner: false,
      title: 'HealHer-SmartBand',
      theme: buildTheme(),
      initialRoute: '/',
    );
  }
}
