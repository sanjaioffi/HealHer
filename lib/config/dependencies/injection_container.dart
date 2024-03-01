import 'dart:io';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/features/onboard/domain/usecase/auth_user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DependencyInjection {
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

    // Controllers
    await servicesManager.registerGetControllers();

    // UseCase
    await servicesManager.registerUseCases();
  }
}
