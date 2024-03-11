import '../../../../../config/constants/constants.dart';
import '../../../../../config/services/services.dart';
import '../../../../../core/managers/params/hive/hive_params.dart';
import '../../../../../core/managers/usecase/hive/read_from_hive_use_case.dart';
import '../../model/health_model.dart';
import 'health_local_data.dart';

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
