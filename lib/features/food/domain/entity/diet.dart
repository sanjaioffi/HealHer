import '../../data/model/diet_model.dart';

class Diet {
  final String sessionName;
  final double sessionCalories;
  final double sessionCarbs;
  final double sessionFat;
  final double sessionProtein;
  final String sessionMsg;

  Diet(
      {required this.sessionName,
      required this.sessionCalories,
      required this.sessionCarbs,
      required this.sessionFat,
      required this.sessionProtein,
      required this.sessionMsg});

  factory Diet.fromDietModel(DietModel dietModel) {
    return Diet(
      sessionName: dietModel.sessionName,
      sessionCalories: dietModel.sessionCalories,
      sessionCarbs: dietModel.sessionCarbs,
      sessionFat: dietModel.sessionFat,
      sessionProtein: dietModel.sessionProtein,
      sessionMsg: dietModel.sessionMsg,
    );
  }

  // Return Diet from Map<String, dynamic>
  factory Diet.fromMap(Map<String, dynamic> map) {
    return Diet(
      sessionName: map['sessionName'],
      sessionCalories: map['sessionCalories'],
      sessionCarbs: map['sessionCarbs'],
      sessionFat: map['sessionFat'],
      sessionProtein: map['sessionProtein'],
      sessionMsg: map['sessionMsg'],
    );
  }

  // Return Diet to Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'sessionName': sessionName,
      'sessionCalories': sessionCalories,
      'sessionCarbs': sessionCarbs,
      'sessionFat': sessionFat,
      'sessionProtein': sessionProtein,
      'sessionMsg': sessionMsg,
    };
  }
}
