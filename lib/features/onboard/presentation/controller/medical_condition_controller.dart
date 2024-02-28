import 'package:get/get.dart';

class MedicalIssuesController extends GetxController {
  // Observable list to store medical issues
  final RxList<String> medicalIssues = <String>[].obs;

  // Function to add a medical issue to the list
  void addMedicalIssue(String issue) {
    medicalIssues.add(issue);
  }

  // Function to remove a medical issue from the list
  void removeMedicalIssue(String issue) {
    medicalIssues.remove(issue);
  }
}
