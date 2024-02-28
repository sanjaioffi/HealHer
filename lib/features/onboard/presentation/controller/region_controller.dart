import 'package:get/get.dart';

class RegionController extends GetxController {
  var regionType = [1, 0].obs;
  void updateGender(int index) {
    if (index == 0) {
      regionType[0] = 1;
      regionType[1] = 0;
    } else {
      regionType[0] = 0;
      regionType[1] = 1;
    }
  }
}
