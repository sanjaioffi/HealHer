import 'package:dartz/dartz.dart';
import 'package:heal_her/src/core/error/error.dart';
import 'package:heal_her/src/features/recommendation/domain/entities/entities.dart';

import '../repository/workout_repo.dart';

class WorkoutUseCase {
  final WorkoutRepository _workoutRepository;

  WorkoutUseCase(this._workoutRepository);

  Future<Either<Failure, List<WorkoutEntity>>> getWorkouts() async {
    return _workoutRepository.getWorkouts();
  }
}
