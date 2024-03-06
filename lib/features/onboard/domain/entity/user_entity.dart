class UserEntity {
  // Empty Constructor
  UserEntity();

  String userName = "";

  // Age & Dob
  DateTime userDob = DateTime(1900);
  int userAge = 0;

  // Essentials
  bool userIsMale = false;
  double userHeight = 50;
  double userWeight = 48;

  // Calories
  double userCalories = 0;
  double userBmi = 0;

  // Period
  int periodCycle = 20;
  DateTime lastPeriodDate = DateTime(1900);

  // Activity
  List<String> userMedicalIssues = [];
  int activityIdx = -1;

  // to Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'userAge': userAge,
      'userIsMale': userIsMale,
      'userHeight': userHeight,
      'userWeight': userWeight,
      'userPeriodCycle': periodCycle,
      'userLastPeriodDate': lastPeriodDate,
      'userMedicalIssues': userMedicalIssues,
      'userActivityIdx': activityIdx,
      'userBmi': calculateBmi(),
      'userCalories': caloriesNeeded(),
    };
  }

  // from Map
  UserEntity.fromMap(Map<String, dynamic> map) {
    userName = map['userName'];
    userAge = map['userAge'];
    userIsMale = map['userIsMale'];
    userHeight = map['userHeight'];
    userWeight = map['userWeight'];
    periodCycle = map['userPeriodCycle'];
    lastPeriodDate = map['userLastPeriodDate'];
    userMedicalIssues = map['userMedicalIssues'];
    activityIdx = map['userActivityIdx'];
    userBmi = map['userBmi'];
    userCalories = map['userCalories'];
  }

  //
  double calculateBmi() {
    return userWeight / (userHeight * userHeight);
  }

  double caloriesNeeded() {
    final double bmr =
        calculateBMR(userWeight, userHeight, userAge, userIsMale);

    final double calorieRequired = calculateCaloriesNeeded(bmr, activityIdx);
    return calorieRequired;
  }

  //
  double calculateBMR(double weight, double height, int age, bool userIsMale) {
    if (userIsMale) {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  double calculateCaloriesNeeded(double bmr, int activityFactor) {
    return bmr * activityFactor;
  }
}
