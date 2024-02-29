import 'package:get/get.dart';

import '../../domain/entity/user_entity.dart';

class GenderController extends GetxController {
  var isMale = false.obs;

  void updateGender(bool isMale) {
    userEntity.userIsMale = false;
  }
}
