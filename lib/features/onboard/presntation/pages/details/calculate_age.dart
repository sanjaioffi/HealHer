int calculateAge(DateTime dob) {
  final today = DateTime.now();
  final year = today.year - dob.year;
  final month = today.month - dob.month;
  final day = today.day - dob.day;

  if (month < 0) {
    return year - 1;
  } else if (month == 0 && day < 0) {
    return year - 1;
  } else {
    return year;
  }
}
