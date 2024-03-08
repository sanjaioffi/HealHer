import 'dart:developer';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/managers/params/cache/cache_params.dart';
import '../../core/managers/usecase/cache/write_to_cache_use_case.dart';
import '../../features/onboard/domain/usecase/auth_user.dart';
import '../../features/recommendation/data/implementation/workout_impl.dart';
import '../../features/recommendation/data/source/workout_source.dart';
import '../../features/recommendation/domain/repository/workout_repo.dart';
import '../../features/recommendation/domain/usecase/workout_usecase.dart';
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
      final result = await serviceLocator<AuthenticateUserCase>()();

      //
      if (result == true) {
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

  final injection = GetIt.instance;

void setUpInjection() {
  // Repository
  injection.registerLazySingleton<WorkoutRepository>(
    () => WorkoutImplementation(
      source: injection(),
    ),
  );

  // Data Source
  injection.registerLazySingleton<WorkoutSource>(
    () => WorkoutSourceImpl(),
  );

  // Use Case
  injection.registerLazySingleton<WorkoutUseCase>(
    () => WorkoutUseCase(
      injection(),
    ),
  );
}