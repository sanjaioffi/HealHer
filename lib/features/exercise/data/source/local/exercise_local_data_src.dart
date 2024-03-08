import '../../model/exercise_model.dart';

abstract class ExerciseLocalDataSrc {
  //
  Future<List<ExerciseModel>> getExercisesFromLocalDataBase();
}
