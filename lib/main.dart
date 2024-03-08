import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heal_her/src/core/injection/dp_injection.dart';

import 'src/core/config/routes/routes.dart';
import 'src/core/config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        defaultTransition: Transition.cupertino,
        transitionDuration: const Duration(seconds: 1),
        getPages: routes,
        debugShowCheckedModeBanner: false,
        title: 'HealHer-SmartBand',
        theme: buildTheme(),
        initialRoute: "/workoutRecommendation",
      ),
    );
  }
}
