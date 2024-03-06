class UserEntity {
  String userName = "";

  // Age & Dob
  DateTime userDob = DateTime(1900);
  int userAge = 0;

  // Essentials
  bool userIsMale = false;
  double userHeight = 50;
  double userWeight = 48;

  // Period
  int periodCycle = 20;
  DateTime lastPeriodDate = DateTime(1900);

  // Activity
  List<String> userMedicalIssues = [];
  int activityIdx = -1;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'userAge': userAge,
      'userIsMale': userIsMale,
      'userHeight': userHeight,
      'userWeight': userWeight,
      'periodCycle': periodCycle,
      'userMedicalIssues': userMedicalIssues,
      'activityIdx': activityIdx,
    };
  }
}
