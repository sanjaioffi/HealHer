import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/core/managers/interface/hive_manager.dart';
import 'package:heal_her/features/onboard/data/data_src/local/onboard_local_data_src.dart';

class OnboardLocalDataSrcImpl implements OnboardLocalDataSrc {
  final HiveManager hiveManager;

  OnboardLocalDataSrcImpl(this.hiveManager);

  @override
  Future<void> writeUserDataToHive(Map<String, dynamic> userDataMap) async {
    await hiveManager.initialiseHiveBox(userBoxReference);
    await hiveManager.writeToHive(
        userBoxReference, userDataReference, userDataMap);
  }
}
