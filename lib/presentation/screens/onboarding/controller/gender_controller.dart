import 'package:get/get.dart';

class GenderController extends GetxController {
  var gender = [0, 0].obs;
  void updateGender(int index) {
    if (index == 0) {
      gender[0] = 1;
      gender[1] = 0;
    } else {
      gender[0] = 0;
      gender[1] = 1;
    }
  }
}
