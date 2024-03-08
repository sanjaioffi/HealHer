import '../../model/exercise_model.dart';

abstract class ExerciseRemoteDataSrc {
  Future<List<ExerciseModel>> getWorkouts();
}
