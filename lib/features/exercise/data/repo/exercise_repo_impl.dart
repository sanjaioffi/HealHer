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

    List<ExerciseModel> response = await exerciseRemoteDataSrc.getWorkouts();

    for (ExerciseModel exerciseModel in response) {
      exerciseEntities.add(exerciseModel.toEntity());
    }

    return exerciseEntities;
  }
}
