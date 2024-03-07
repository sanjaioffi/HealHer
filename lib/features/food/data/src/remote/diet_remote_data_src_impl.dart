import 'dart:convert';
import 'dart:developer';

import 'package:heal_her/features/food/data/model/diet_model.dart';
import 'package:heal_her/features/food/data/src/remote/diet_remote_data_src.dart';
import 'package:http/http.dart' as http;

class DietRemoteDataSrcImpl implements DietRemoteDataSrc {
  @override
  Future<List<DietModel>> fetchDiet(double calories) async {
    //
    List<DietModel> dietModels = [];

    final String apiLink =
        "https://recommendation-endpoint.onrender.com/v1/recommend/food/cal/$calories";

    http.get(Uri.parse(apiLink)).then(
      (response) {
        if (response.statusCode == 200) {
          // If the request is successful, print the response body

          final apiRespnse = jsonEncode(response.body);

          log(apiRespnse);

          //
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
      },
    ).catchError(
      (error) {},
    );

    //
    return dietModels;
  }
}



// {
//   "diet_plan": [
//     {
//       "morning": {
//         "calorie": 840,
//         "carbs": 336,
//         "fibre": 294,
//         "protien": 210,
//         "msg": "In the Morning it is very good to Maximise the consumption of food. Hence 336.0g of carbohydrate, 294.0g of protein & 210.0g of fat content is recommended"
//       },
//       "afternoon": {
//         "calorie": 600,
//         "carbs": 240,
//         "fibre": 210,
//         "protien": 150,
//         "msg": "In the Afternoon it is very good to Maximise the consumption of food. Hence 240.0g of carbohydrate, 210.0g of protein & 150.0g of fat content is recommended"
//       },
//       "night": {
//         "calorie": 525,
//         "carbs": 210,
//         "fibre": 183.75,
//         "protien": 131.25,
//         "msg": "In the Night it is very good to Minimise the consumption of food. Hence 210.0g of carbohydrate, 183.75g of protein & 131.25g of fat content is recommended"
//       }
//     }
//   ]
// }