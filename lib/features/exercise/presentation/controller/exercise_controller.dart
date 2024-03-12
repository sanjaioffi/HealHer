import 'dart:developer';

import 'package:get/get.dart';

import '../../domain/entities/exercise.dart';
import '../../domain/usecase/fetch_exercise_use_case.dart';

class ExerciseController extends GetxController {
  final FetchExerciseUseCase fetchExerciseUseCase;

  ExerciseController(this.fetchExerciseUseCase);

  RxList exercises = <Exercise>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getExercises();
  }

  //
  Future<void> getExercises() async {
    log("Fetching");
    exercises.value = await fetchExerciseUseCase.call();

    log("The exercise lenght is : ${exercises.length.toString()}");

    update();
  }
}
