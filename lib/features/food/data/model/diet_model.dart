// ignore_for_file: public_member_api_docs, sort_constructors_first
class DietModel {
  final String sessionName;
  final double sessionCalories;
  final double sessionCarbs;
  final double sessionFat;
  final double sessionProtein;
  final String sessionMsg;
  DietModel({
    required this.sessionName,
    required this.sessionCalories,
    required this.sessionCarbs,
    required this.sessionFat,
    required this.sessionProtein,
    required this.sessionMsg,
  });

  factory DietModel.fromJson(
      Map<String, dynamic> jsonResponse, String sessionName) {
    // convert json response to DietModel object
    return DietModel(
      sessionName: sessionName,
      sessionCalories: jsonResponse['sessionCalories'],
      sessionCarbs: jsonResponse['sessionCarbs'],
      sessionFat: jsonResponse['sessionFat'],
      sessionProtein: jsonResponse['sessionProtein'],
      sessionMsg: jsonResponse['sessionMsg'],
    );
  }

  // from Map
  factory DietModel.fromMap(dynamic map) {
    return DietModel(
      sessionName: map['sessionName'],
      sessionCalories: map['sessionCalories'],
      sessionCarbs: map['sessionCarbs'],
      sessionFat: map['sessionFat'],
      sessionProtein: map['sessionProtein'],
      sessionMsg: map['sessionMsg'],
    );
  }
}



//  "morning": {
//         "calorie": 840,
//         "carbs": 336,
//         "fibre": 294,
//         "protien": 210,
//         "msg": "In the Morning it is very good to Maximise the consumption of food. Hence 336.0g of carbohydrate, 294.0g of protein & 210.0g of fat content is recommended"
//       },