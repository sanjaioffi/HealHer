import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/workout_model.dart';

abstract class WorkoutSource {
  Future<List<WorkoutModel>> getWorkouts();
}

// Implementation of the WorkoutSource
//
class WorkoutSourceImpl implements WorkoutSource {
  @override
  Future<List<WorkoutModel>> getWorkouts() async {
  
    List<WorkoutModel> workouts = [];
    try {
    
      final response = await http.get(Uri.parse(
          'https://recommendation-endpoint.onrender.com/v1/recommend/exercise/age/20/diff/0'));
      if (response.statusCode == 200) {
        // string response to json
        final List mapList = jsonDecode(response.body)["Exercises"];
        for (var element in mapList) {
          workouts.add(WorkoutModel.fromMap(element));
        }

        return workouts;
      } else {
        print(response.statusCode);
        throw Exception('Failed to load workouts');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load workouts');
    }
  }
}
