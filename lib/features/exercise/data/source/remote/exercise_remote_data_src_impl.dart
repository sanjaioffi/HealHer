import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/exercise_model.dart';
import 'exercise_remote_data_src.dart';

class ExerciseRemoteDataSrcImpl implements ExerciseRemoteDataSrc {
  //
  @override
  Future<List<ExerciseModel>> getWorkouts() async {
    //
    List<ExerciseModel> exerciseModels = [];

    //
    try {
      final response = await http.get(Uri.parse(
          'https://recommendation-endpoint.onrender.com/v1/recommend/exercise/age/20/diff/0'));
      if (response.statusCode == 200) {
        // string response to json
        final List mapList = jsonDecode(response.body)["Exercises"];
        for (var element in mapList) {
          exerciseModels.add(ExerciseModel.fromMap(element));
        }

        return exerciseModels;
      } else {
        return exerciseModels;
      }
    } catch (e) {
      return exerciseModels;
    }
  }
}
