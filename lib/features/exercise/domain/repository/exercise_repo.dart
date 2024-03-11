import '../entities/exercise.dart';

abstract class ExerciseRepo {
  Future<List<Exercise>> getWorkouts();
}
