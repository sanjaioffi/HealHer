import '../../../../../config/constants/constants.dart';
import '../../../../../config/services/services.dart';
import '../../../../../core/managers/params/hive/hive_params.dart';
import '../../../../../core/managers/usecase/hive/read_from_hive_use_case.dart';
import 'exercise_local_data_src.dart';

class ExerciseLocalDataSrcImpl implements ExerciseLocalDataSrc {
  //
  @override
  Future getExercisesFromLocalDataBase() async {
    final result = await serviceLocator<ReadFromHiveUseCase>().call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userExerciseReference,
      ),
    );

    // If the result is not null && result['date'] is equal to today
    if (result != null) {
      return result;
    }
  }
}
