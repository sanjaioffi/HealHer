import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entities/entities.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<WorkoutEntity>>> getWorkouts();
}
