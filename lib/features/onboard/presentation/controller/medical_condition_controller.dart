import 'dart:developer';

import 'package:get/get.dart';
import 'package:heal_her/config/constants/constants.dart';

class MedicalIssuesController extends GetxController {
  // Observable list to store medical issues
  final RxList<String> medicalIssues = <String>[].obs;

  void checkIsAvailable(String issue) {
    if (medicalIssues.contains(issue)) {
      medicalIssues.remove(issue);
    } else {
      medicalIssues.add(issue);
    }

    userEntity.userMedicalIssues = medicalIssues;

    return;
  }

  // Function to add a medical issue to the list
}
