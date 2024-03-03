import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:heal_her/core/managers/contract/hive_manager_impl.dart';
import 'package:heal_her/core/managers/interface/hive_manager.dart';
import 'package:heal_her/features/onboard/domain/usecase/auth_user.dart';
import 'package:heal_her/features/onboard/presentation/controller/onboard_data_controller.dart';

final GetIt serviceLocator = GetIt.instance;

class ServicesManager {
  // Managers Like Mongo, Hive
  Future<void> resgisterManagers() async {
    serviceLocator.registerSingleton<HiveManager>(HiveManagerImpl());
  }

  // Get Controllers
  Future<void> registerGetControllers() async {
    // Register User Data Controller
    serviceLocator.registerSingleton<OnboardDataController>(
        OnboardDataController(hiveManager: serviceLocator()));
  }

  Future<void> registerUseCases() async {
    // UseCase Registrations

    serviceLocator.registerSingleton<AuthenticateUser>(
      AuthenticateUser(
        serviceLocator(),
      ),
    );
  }
}
