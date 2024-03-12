import 'dart:developer';

import '../../domain/entities/exercise.dart';

class ExerciseModel {
  String workoutName;
  String description;
  String videoUrl;
  String workoutSets;
  ExerciseModel({
    required this.workoutName,
    required this.description,
    required this.videoUrl,
    required this.workoutSets,
  });

// map to  json
  Map<String, dynamic> toMap() {
    return {
      'exercise_name': workoutName,
      'exercie_description': description,
      'exercise_video': videoUrl,
      'exercise_reps': workoutSets,
    };
  }

  // map from json
  factory ExerciseModel.fromMap(dynamic map) {
    log("Recieved Map : ${map.toString()}");

    //
    final ExerciseModel exerciseModel = ExerciseModel(
      workoutName: map['exercise_name'] ?? "No Name ",
      description: map['exercie_description'] ?? "No Description",
      videoUrl: map['exercise_video'] ?? "No Video Url",
      workoutSets: "${map['exercise_reps']} Reps",
    );

    log("Converted : ${exerciseModel.toMap().toString()}");

    return exerciseModel;
  }

  Exercise toEntity() {
    return Exercise(
      workoutName: workoutName,
      description: description,
      videoUrl: videoUrl,
      workoutSets: workoutSets,
    );
  }
}
