import 'package:get/get.dart';

class FoodController extends GetxController {
  var foodType = [1, 0].obs;
  void updateGender(int index) {
    if (index == 0) {
      foodType[0] = 1;
      foodType[1] = 0;
    } else {
      foodType[0] = 0;
      foodType[1] = 1;
    }
  }
}
