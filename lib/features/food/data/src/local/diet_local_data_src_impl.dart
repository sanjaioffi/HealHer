import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/managers/usecase/hive/read_from_hive_use_case.dart';
import 'package:heal_her/core/managers/usecase/hive/write_to_hive_use_case.dart';
import 'package:heal_her/features/food/data/model/diet_model.dart';
import 'package:heal_her/features/food/data/src/local/diet_local_data_src.dart';

class DietLocalDataSrcImpl implements DietLocalDataSrc {
  @override
  Future<void> cacheDietPlan(Map dietData) async {
    await serviceLocator<WriteToHiveUseCase>().call(
      params: HiveAddParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDietReference,
        data: dietData,
      ),
    );
  }

  @override
  Future<List<DietModel>> retrieveDietPlan() async {
    //

    final List<DietModel> dietModel = [];

    final respone = await serviceLocator<ReadFromHiveUseCase>().call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDietReference,
      ),
    );

    if (respone != null) {
      return respone;
    }

    return dietModel;
  }
}
