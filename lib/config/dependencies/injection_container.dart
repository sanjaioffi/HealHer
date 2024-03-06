import 'dart:io';
import 'package:heal_her/config/routes/route_names.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/features/onboard/domain/usecase/auth_user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

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

    // UseCase
    await servicesManager.registerUseCases();

    // Controllers
    await servicesManager.registerGetControllers();

    //Controller Register in Memory

    Future<void> checkRoute() async {
      final result = await serviceLocator<AuthenticateUserCase>()();
      if (result == true) {
        initialRoute = AppRoute.homeScreen;
      }
    }

    await checkRoute();

    //
    await servicesManager.registerControllersInMemory();
  }
}
