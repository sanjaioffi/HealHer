import 'package:get/get.dart';
import 'package:heal_her/features/onboard/domain/entity/user_entity.dart';

class GenderController extends GetxController {
  var isMale = false.obs;

  void updateGender(bool isMale) {
    userEntity.userIsMale = false;
  }
}
