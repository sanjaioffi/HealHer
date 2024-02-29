class UserEntity {
  String userName = "";
  DateTime userDob = DateTime.now();
  int userAge = 0;
  bool userIsMale = true;

  DateTime lastPeriodDate = DateTime.now();
}

UserEntity userEntity = UserEntity();
