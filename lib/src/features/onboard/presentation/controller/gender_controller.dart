import 'package:get/get.dart';
import 'package:heal_her/src/core/config/constants/constants.dart';

class GenderController extends GetxController {
  var isMale = false.obs;

  void updateGender(bool isMale) {
    userEntity.userIsMale = false;
  }
}
