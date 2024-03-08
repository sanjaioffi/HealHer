import 'dart:developer';

import '../../model/exercise_model.dart';

import '../../../../../config/constants/constants.dart';
import '../../../../../config/services/services.dart';
import '../../../../../core/managers/params/hive/hive_params.dart';
import '../../../../../core/managers/usecase/hive/read_from_hive_use_case.dart';
import 'exercise_local_data_src.dart';

class ExerciseLocalDataSrcImpl implements ExerciseLocalDataSrc {
  //
  @override
  Future<List<ExerciseModel>> getExercisesFromLocalDataBase() async {
    final List<ExerciseModel> userExerciseModels = [];

    // Check If null or today
    final result = await serviceLocator<ReadFromHiveUseCase>().call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userExerciseTrackerReference,
      ),
    );

    if (result != null) {
      log("The Box has something");
      if (result != DateTime.now().day) {
        return userExerciseModels;
      } else {
        final exercises = await serviceLocator<ReadFromHiveUseCase>().call(
          params: HiveRetrieveParams(
            hiveBoxName: userBoxReference,
            hiveKey: userExerciseReference,
          ),
        );

        //  iterate exercises and convert it to map
        for (dynamic exercise in exercises) {
          userExerciseModels.add(ExerciseModel.fromMap(exercise));
        }

        return userExerciseModels;
      }
    }
    return userExerciseModels;
  }
}
