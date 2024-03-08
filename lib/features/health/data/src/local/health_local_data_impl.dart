import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/managers/usecase/hive/read_from_hive_use_case.dart';
import 'package:heal_her/features/health/data/model/health_model.dart';
import 'package:heal_her/features/health/data/src/local/health_local_data.dart';

class HealthLocalDataImpl extends HealthLocalDataSrc {
  @override
  Future<List<HealthModel>> getHealthRecommendationsFromLocalDataBase() async {
    //
    final List<HealthModel> healthModels = [];

    final response = await serviceLocator<ReadFromHiveUseCase>().call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userHealthReference,
      ),
    );

    if (response != null) {
      for (var cacheMap in response) {
        healthModels.add(HealthModel.fromJson(cacheMap));
      }
    }

    return healthModels;
  }
}
