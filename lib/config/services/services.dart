import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:heal_her/features/health/data/repo/health_repo_impl.dart';
import 'package:heal_her/features/health/data/src/local/health_local_data_impl.dart';
import 'package:heal_her/features/health/data/src/remote/health_remote_data_src_impl.dart';
import 'package:heal_her/features/health/domain/repo/health_repo.dart';
import 'package:heal_her/features/health/presentation/controller/health_controller.dart';

import '../../core/managers/contract/hive_manager_impl.dart';
import '../../core/managers/contract/runtime_manager_impl.dart';
import '../../core/managers/interface/hive_manager.dart';
import '../../core/managers/interface/runtime_manager.dart';
import '../../core/managers/usecase/cache/read_from_cache_use_case.dart';
import '../../core/managers/usecase/cache/write_to_cache_use_case.dart';
import '../../core/managers/usecase/hive/delete_from_hive_use_case.dart';
import '../../core/managers/usecase/hive/read_from_hive_use_case.dart';
import '../../core/managers/usecase/hive/write_to_hive_use_case.dart';
import '../../features/device/controller/data_controller.dart';
import '../../features/device/controller/scan_controller.dart';
import '../../features/diet/data/repo/diet_repo_impl.dart';
import '../../features/diet/data/src/local/diet_local_data_src.dart';
import '../../features/diet/data/src/local/diet_local_data_src_impl.dart';
import '../../features/diet/data/src/remote/diet_remote_data_src.dart';
import '../../features/diet/data/src/remote/diet_remote_data_src_impl.dart';
import '../../features/diet/domain/repo/diet_repo.dart';
import '../../features/diet/presentation/controller/diet_controller.dart';
import '../../features/exercise/data/repo/exercise_repo_impl.dart';
import '../../features/exercise/data/source/local/exercise_local_data_src.dart';
import '../../features/exercise/data/source/local/exercise_local_data_src_impl.dart';
import '../../features/exercise/data/source/remote/exercise_remote_data_src.dart';
import '../../features/exercise/data/source/remote/exercise_remote_data_src_impl.dart';
import '../../features/exercise/domain/repository/exercise_repo.dart';
import '../../features/exercise/domain/usecase/fetch_exercise_use_case.dart';
import '../../features/health/data/src/local/health_local_data.dart';
import '../../features/health/data/src/remote/health_remote_data_src.dart';
import '../../features/onboard/domain/usecase/auth_user.dart';
import '../../features/onboard/presentation/controller/onboard_data_controller.dart';
import '../../features/profile/presentation/controller/profile_controller.dart';

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
    /// Diet

    // Diet Local Src
    serviceLocator.registerSingleton<DietLocalDataSrc>(DietLocalDataSrcImpl());

    // Remote Local Src
    serviceLocator
        .registerSingleton<DietRemoteDataSrc>(DietRemoteDataSrcImpl());

    /// Exercise

    // Local

    serviceLocator
        .registerSingleton<ExerciseLocalDataSrc>(ExerciseLocalDataSrcImpl());

    // Remote
    serviceLocator
        .registerSingleton<ExerciseRemoteDataSrc>(ExerciseRemoteDataSrcImpl());

    /// Health
    ///
    /// // Local
    ///
    serviceLocator.registerSingleton<HealthLocalDataSrc>(HealthLocalDataImpl());

    // Remote
    serviceLocator
        .registerSingleton<HealthRemoteDataSrc>(HealthRemoteDataSrcImpl());
  }

  // Repository Injection
  Future<void> resgisterRepositories() async {
    // Diet Repository
    serviceLocator.registerSingleton<DietRepo>(
      DietRepoImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    );

    // WorkOut Repository
    serviceLocator.registerSingleton<ExerciseRepo>(
      ExerciseRepoImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    );

    // Health Repository
    serviceLocator.registerSingleton<HealthRepo>(
      HealthRepoImpl(serviceLocator(), serviceLocator()),
    );
  }

  // Get Controllers
  Future<void> registerGetControllers() async {
    // Register User Data Controller
    serviceLocator.registerSingleton<OnboardDataController>(
      OnboardDataController(),
    );

    // Profile Controller
    serviceLocator.registerSingleton<ProfileController>(
      ProfileController(),
    );

    // Diet Controller
    serviceLocator.registerSingleton<DietController>(DietController(
      serviceLocator(),
    ));

    // Health Controller
    serviceLocator.registerSingleton<HealthController>(HealthController(
      serviceLocator(),
    ));
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

    // To Get Workout from cloud
    serviceLocator.registerSingleton<FetchExerciseFromRemote>(
      FetchExerciseFromRemote(
        serviceLocator(),
      ),
    );
  }

  Future<void> registerControllersInMemory() async {
    Get.put(serviceLocator<ProfileController>());
    Get.put(ScanController());
    Get.put(DataController());
  }
}
