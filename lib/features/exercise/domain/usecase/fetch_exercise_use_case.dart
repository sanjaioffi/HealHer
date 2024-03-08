import '../../../../core/usecase/use_case.dart';
import '../entities/exercise.dart';
import '../repository/exercise_repo.dart';

class FetchExerciseFromRemote extends UseCase<List<Exercise>, void> {
  final ExerciseRepo exerciseRepo;

  FetchExerciseFromRemote(this.exerciseRepo);

  @override
  Future<List<Exercise>> call({void params}) async {
    return await exerciseRepo.getWorkouts();
  }
}
