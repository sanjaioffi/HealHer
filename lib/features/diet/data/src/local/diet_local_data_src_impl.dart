import 'dart:developer';

import '../../../../../config/constants/constants.dart';
import '../../../../../config/services/services.dart';
import '../../../../../core/managers/params/hive/hive_params.dart';
import '../../../../../core/managers/usecase/hive/read_from_hive_use_case.dart';
import '../../model/diet_model.dart';
import 'diet_local_data_src.dart';

class DietLocalDataSrcImpl implements DietLocalDataSrc {
  @override
  Future<List<DietModel>> retrieveDietPlan() async {
    //

    log("Local Impl Called");

    final List<DietModel> dietModels = [];

    final respone = await serviceLocator<ReadFromHiveUseCase>().call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDietReference,
      ),
    );

    if (respone == null) {
      log('No diet plan found');
      return dietModels;
    }

    log(" The response in impl : ${respone.toString()}");

    for (dynamic dietMap in respone) {
      dietModels.add(DietModel.fromDictionary(dietMap));
    }

    return dietModels;
  }
}
