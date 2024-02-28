import 'package:get/get.dart';


class TargetsController extends GetxController {
  // Observable list to store medical issues
  final RxList<String> targets = <String>[].obs;

  // Function to add a medical issue to the list
  void addTarget(String target) {
    targets.add(target);
  }

  // Function to remove a medical issue from the list
  void removeTarget(String target) {
    targets.remove(target);
  }
}