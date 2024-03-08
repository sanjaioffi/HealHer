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

  // from Map
  factory DietModel.fromMap(dynamic map, String sessionName) {
    return DietModel(
      sessionName: sessionName,
      sessionCalories: map['calorie'],
      sessionCarbs: map['carbs'],
      sessionFat: map['fibre'] ?? -1,
      sessionProtein: map['protien'],
      sessionMsg: map['msg'],
    );
  }

  // return Diet Model from Dictionary
  factory DietModel.fromDictionary(dynamic dictionary) {
    return DietModel(
      sessionName: dictionary['sessionName'],
      sessionCalories: dictionary['sessionCalories'],
      sessionCarbs: dictionary['sessionCarbs'],
      sessionProtein: dictionary['sessionProtein'],
      sessionFat: dictionary['sessionFat'],
      sessionMsg: dictionary['sessionMsg'],
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