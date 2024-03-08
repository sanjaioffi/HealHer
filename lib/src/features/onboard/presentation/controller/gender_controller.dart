import 'package:get/get.dart';

import '../../../../core/config/constants/constants.dart';

class GenderController extends GetxController {
  var isMale = false.obs;

  void updateGender(bool isMale) {
    userEntity.userIsMale = false;
  }
}
