import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/screens/home/view/heart.dart';
import 'package:heal_her/presentation/screens/home/view/main_screen.dart';
import 'package:heal_her/presentation/screens/home/view/steps_screen/graph.dart';
import 'package:heal_her/presentation/screens/home/view/steps_screen/steps_screen.dart';
import 'package:heal_her/presentation/utils/routes.dart';
import 'package:heal_her/theme/build_theme.dart';

import 'presentation/common/screen_utils/screen_size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return GetMaterialApp(
      
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 1),
      getPages: routes,
      debugShowCheckedModeBanner: false,
      title: 'HealHer-SmartBand',
      theme: buildTheme(
        
      ),
      initialRoute: '/',
      // home: MainScreen(),
    );
  }
}
