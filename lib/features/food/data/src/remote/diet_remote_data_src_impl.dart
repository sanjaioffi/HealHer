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

    await http.get(Uri.parse(apiLink)).then(
      (response) {
        if (response.statusCode == 200) {
          final apiResponse = jsonDecode(response.body);
          final result = apiResponse['diet_plan'][0];
          dietModels.add(DietModel.fromMap(result["morning"], 'Morning'));
          dietModels.add(DietModel.fromMap(result["afternoon"], 'Afternoon'));
          dietModels.add(DietModel.fromMap(result["night"], 'Night'));
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
      },
    ).catchError(
      (error) {
        log(error.toString());
      },
    );

    //
    return dietModels;
  }
}
