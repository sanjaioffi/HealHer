import 'dart:developer';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/managers/params/cache/cache_params.dart';
import '../../core/managers/usecase/cache/write_to_cache_use_case.dart';
import '../../features/onboard/domain/usecase/auth_user.dart';
import '../routes/route_names.dart';
import '../services/services.dart';

class DependencyInjection {
  String initialRoute = AppRoute.onboardWelcome;

  //
  ServicesManager servicesManager = ServicesManager();

  Future<void> inject() async {
    //
    final Directory documentDirectory =
        await getApplicationDocumentsDirectory();

    // Hive Initialisation
    Hive.init(documentDirectory.path);

    await Hive.openBox('device');
    await Hive.openBox('data');
    
  await Hive.openBox(
      'day ${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}');

    // Managers
    await servicesManager.resgisterManagers();

    log("Completed Managers");

    // Data Src
    await servicesManager.registerDataSrc();

    log("Completed Data Src");

    //Repository
    await servicesManager.resgisterRepositories();

    log("Completed Repository");

    // UseCase
    await servicesManager.registerUseCases();

    // Controllers
    await servicesManager.registerGetControllers();

    //Controller Register in Memory

    Future<void> checkRoute() async {
      final result = await serviceLocator<AuthenticateUserCase>().call();

      if (result == false) {
        return;
      } else {
        serviceLocator<WriteToCacheUseCase>().call(
          params: CacheWriteParams(
            cacheKey: 'user_data',
            cacheValue: result,
          ),
        );
        initialRoute = AppRoute.homeScreen;
      }
    }

    await checkRoute();

    //
    await servicesManager.registerControllersInMemory();
  }
}
