import 'dart:developer';

import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/managers/usecase/hive/read_from_hive_use_case.dart';
import 'package:heal_her/features/food/data/model/diet_model.dart';
import 'package:heal_her/features/food/data/src/local/diet_local_data_src.dart';

class DietLocalDataSrcImpl implements DietLocalDataSrc {
  @override
  Future<List<DietModel>> retrieveDietPlan() async {
    //
    final List<DietModel> dietModels = [];

    final respone = await serviceLocator<ReadFromHiveUseCase>().call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDietReference,
      ),
    );

    log("DOne");

    for (dynamic dietMap in respone) {
      dietModels.add(DietModel.fromDictionary(dietMap));
    }

    log("DOne");

    return dietModels;
  }
}
