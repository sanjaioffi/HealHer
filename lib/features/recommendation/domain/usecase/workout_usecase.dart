import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';
import '../entities/entities.dart';

import '../repository/workout_repo.dart';

class WorkoutUseCase {
  final WorkoutRepository _workoutRepository;

  WorkoutUseCase(this._workoutRepository);

  Future<Either<Failure, List<WorkoutEntity>>> getWorkouts() async {
    return _workoutRepository.getWorkouts();
  }
}