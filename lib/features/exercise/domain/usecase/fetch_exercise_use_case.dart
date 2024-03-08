import '../../../../core/usecase/use_case.dart';
import '../entities/exercise.dart';
import '../repository/exercise_repo.dart';

class FetchExerciseUseCase extends UseCase<List<Exercise>, void> {
  final ExerciseRepo exerciseRepo;

  FetchExerciseUseCase(this.exerciseRepo);

  @override
  Future<List<Exercise>> call({void params}) async {
    return await exerciseRepo.getWorkouts();
  }
}
