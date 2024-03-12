import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'config/dependencies/injection_container.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_theme.dart';
import 'features/device/controller/data_controller.dart';
import 'features/device/controller/scan_controller.dart';

final DependencyInjection dependencyInjection = DependencyInjection();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
  Directory path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  await Hive.openBox('device');
  await Hive.openBox('data');
  await Hive.openBox('day ${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}');
  ScanController().checkConnnetedDevices();
  Get.put(ScanController());
  Get.put(DataController());

  await dependencyInjection.inject();

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
        initialRoute: dependencyInjection.initialRoute,
        // home: const PeriodsRecommendationPage(),
      ),
    );
  }
}



