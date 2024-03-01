import 'package:heal_her/config/services/services.dart';

class DependencyInjection {
  ServicesManager servicesManager = ServicesManager();

  Future<void> inject() async {
    // Managers
    await servicesManager.resgisterManagers();

    // Controllers
    await servicesManager.registerGetControllers();

    // Inject
    await servicesManager.registerControllersInMemory();
  }
}
