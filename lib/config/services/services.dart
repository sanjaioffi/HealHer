import 'package:get_it/get_it.dart';
import 'package:heal_her/core/managers/contract/hive_manager_impl.dart';
import 'package:heal_her/core/managers/interface/hive_manager.dart';

class Services {
  final GetIt service = GetIt.instance;

  Future<void> resgisterManagers() async {
    service.registerSingleton<HiveManager>(HiveManagerImpl());
  }
}
