import 'package:dartz/dartz.dart';
import 'package:heal_her/src/core/error/error.dart';
import 'package:heal_her/src/features/recommendation/data/source/workout_source.dart';
import 'package:heal_her/src/features/recommendation/domain/entities/entities.dart';
import 'package:heal_her/src/features/recommendation/domain/repository/workout_repo.dart';

import '../model/workout_model.dart';

class WorkoutImplementation extends WorkoutRepository {
  final WorkoutSource source;

  WorkoutImplementation({required this.source});

  @override
  Future<Either<Failure, List<WorkoutEntity>>> getWorkouts() async {
    try {
      List<WorkoutModel> r = await source.getWorkouts();

      return Right(r.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
