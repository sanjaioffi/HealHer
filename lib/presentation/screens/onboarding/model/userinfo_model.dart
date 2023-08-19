class UserInfoModel {
  String userName = "Mitun Suresh";
  DateTime userDOB = DateTime(2003, 05, 20);
  int age = 20;
  bool isMale = false;
  int userPeriodLength = 20;
  DateTime lastPeriodDate = DateTime.now();
  double height = 120;
  double weight = 50;
  bool isVegan = true;
  bool isSouthIndian = false;
  List<String> userTargets = [];
  int userFitnessLevel = 0;
  List<String> userMediacalConditon = [];
  int userProfileChoice = 0;
}

UserInfoModel userInfoModel = UserInfoModel();
