import 'package:get_it/get_it.dart';
import 'package:heal_her/src/features/recommendation/data/implementation/workout_imp.dart';

import '../../features/recommendation/data/source/workout_source.dart';
import '../../features/recommendation/domain/repository/workout_repo.dart';
import '../../features/recommendation/domain/usecase/workout.dart';

final injection = GetIt.instance;

void setUpInjection() {
  // Repository
  injection.registerLazySingleton<WorkoutRepository>(
    () => WorkoutImplementation(
      source: injection(),
    ),
  );

  // Data Source
  injection.registerLazySingleton<WorkoutSource>(
    () => WorkoutSourceImpl(),
  );

  // Use Case
  injection.registerLazySingleton<WorkoutUseCase>(
    () => WorkoutUseCase(
      injection(),
    ),
  );
}
