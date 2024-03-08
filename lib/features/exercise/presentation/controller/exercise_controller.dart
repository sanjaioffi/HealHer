import 'package:get/get.dart';

class ExerciseController extends GetxController {
  ExerciseController();

  @override
  void onInit() async {
    super.onInit();
    await getExercises();
  }

  //
  Future<void> getExercises() async {}
}
