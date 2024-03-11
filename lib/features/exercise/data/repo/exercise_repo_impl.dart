import 'dart:developer';

import '../../../../config/constants/constants.dart';
import '../../../../config/services/services.dart';
import '../../../../core/managers/params/hive/hive_params.dart';
import '../../../../core/managers/usecase/hive/write_to_hive_use_case.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/repository/exercise_repo.dart';
import '../model/exercise_model.dart';
import '../source/local/exercise_local_data_src.dart';
import '../source/remote/exercise_remote_data_src.dart';

class ExerciseRepoImpl extends ExerciseRepo {
  // Dependencies
  final ExerciseRemoteDataSrc exerciseRemoteDataSrc;
  final ExerciseLocalDataSrc exerciseLocalDataSrc;

  ExerciseRepoImpl(this.exerciseRemoteDataSrc, this.exerciseLocalDataSrc);

  @override
  Future<List<Exercise>> getWorkouts() async {
    final List<Exercise> exerciseEntities = [];

    final List<ExerciseModel> localResponse =
        await exerciseLocalDataSrc.getExercisesFromLocalDataBase();

    // Verifying Local Db to retrieve Data
    if (localResponse.isNotEmpty) {
      log("Exercise Cached & retrieved");
      for (ExerciseModel exerciseModel in localResponse) {
        exerciseEntities.add(exerciseModel.toEntity());
      }
      return exerciseEntities;
    }

    ///

    final List<Map> cacheMap = [];

//
    List<ExerciseModel> response = await exerciseRemoteDataSrc.getWorkouts();

    log("Exercise Retrieved from CLoud");

    for (ExerciseModel exerciseModel in response) {
      //
      cacheMap.add(exerciseModel.toMap());

      exerciseEntities.add(exerciseModel.toEntity());
    }

    await serviceLocator<WriteToHiveUseCase>().call(
      params: HiveAddParams(
        hiveBoxName: userBoxReference,
        hiveKey: userExerciseReference,
        data: cacheMap,
      ),
    );

    final int day = DateTime.now().day;

    await serviceLocator<WriteToHiveUseCase>().call(
      params: HiveAddParams(
        hiveBoxName: userBoxReference,
        hiveKey: userExerciseTrackerReference,
        data: day,
      ),
    );

    log("Sucessfully Cached");

    return exerciseEntities;
  }
}
