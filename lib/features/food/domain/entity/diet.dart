import 'package:heal_her/features/food/data/model/diet_model.dart';

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
}
