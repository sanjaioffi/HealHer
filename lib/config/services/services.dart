import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:heal_her/core/managers/contract/hive_manager_impl.dart';
import 'package:heal_her/core/managers/contract/runtime_manager_impl.dart';
import 'package:heal_her/core/managers/interface/hive_manager.dart';
import 'package:heal_her/core/managers/interface/runtime_manager.dart';
import 'package:heal_her/core/managers/usecase/cache/read_from_cache_use_case.dart';
import 'package:heal_her/core/managers/usecase/cache/write_to_cache_use_case.dart';
import 'package:heal_her/core/managers/usecase/hive/delete_from_hive_use_case.dart';
import 'package:heal_her/core/managers/usecase/hive/read_from_hive_use_case.dart';
import 'package:heal_her/features/food/data/repo/diet_repo_impl.dart';
import 'package:heal_her/features/food/data/src/local/diet_local_data_src.dart';
import 'package:heal_her/features/food/data/src/local/diet_local_data_src_impl.dart';
import 'package:heal_her/features/food/data/src/remote/diet_remote_data_src.dart';
import 'package:heal_her/features/food/data/src/remote/diet_remote_data_src_impl.dart';
import 'package:heal_her/features/food/domain/repo/diet_repo.dart';
import 'package:heal_her/features/food/domain/usecase/fetch_diet_local.dart';
import 'package:heal_her/features/onboard/domain/usecase/auth_user.dart';
import 'package:heal_her/features/onboard/presentation/controller/onboard_data_controller.dart';
import 'package:heal_her/features/profile/presentation/controller/profile_controller.dart';

import '../../core/managers/usecase/hive/write_to_hive_use_case.dart';

final GetIt serviceLocator = GetIt.instance;

class ServicesManager {
  // Managers Like Mongo, Hive
  Future<void> resgisterManagers() async {
    // Hive Manager Injection
    serviceLocator.registerSingleton<HiveManager>(HiveManagerImpl());

    // Runtime Manager Injection
    serviceLocator
        .registerSingleton<RunTimeStorageCache>(RunTimeStorageCacheImpl());
  }

  Future<void> registerDataSrc() async {
    // Diet Local Src
    serviceLocator.registerSingleton<DietLocalDataSrc>(DietLocalDataSrcImpl());

    // Remote Local Src
    serviceLocator
        .registerSingleton<DietRemoteDataSrc>(DietRemoteDataSrcImpl());
  }

  // Repository Injection
  Future<void> resgisterRepositories() async {
    serviceLocator.registerSingleton<DietRepo>(
      DietRepoImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    );
  }

  // Get Controllers
  Future<void> registerGetControllers() async {
    // Register User Data Controller
    serviceLocator.registerSingleton<OnboardDataController>(
      OnboardDataController(),
    );

    serviceLocator.registerSingleton<ProfileController>(
      ProfileController(),
    );
  }

  // UseCase Registrations
  Future<void> registerUseCases() async {
    /// Hive UseCases ///

    //  ReadFromHive -> Read from UserData
    serviceLocator.registerSingleton<ReadFromHiveUseCase>(
      ReadFromHiveUseCase(serviceLocator()),
    );

    //  WriteToHive -> Write a new Key Value Pair
    serviceLocator.registerSingleton<WriteToHiveUseCase>(
      WriteToHiveUseCase(serviceLocator()),
    );

    // DeleteFromHive ->
    serviceLocator.registerSingleton<DeleteFromHiveUseCase>(
      DeleteFromHiveUseCase(serviceLocator()),
    );

    /// Runtime UseCases ///

    //  ReadFromCache
    serviceLocator.registerSingleton<ReadFromCacheUseCase>(
      ReadFromCacheUseCase(serviceLocator()),
    );

    // FetchFromCache
    serviceLocator.registerSingleton<WriteToCacheUseCase>(
      WriteToCacheUseCase(serviceLocator()),
    );

    // Authenticate User -> Used to verify an existing user
    serviceLocator.registerSingleton<AuthenticateUserCase>(
      AuthenticateUserCase(
        serviceLocator(),
        serviceLocator(),
      ),
    );
  }

  Future<void> registerControllersInMemory() async {
    // Register Profile  Controller
    Get.put(serviceLocator<ProfileController>());
  }
}
