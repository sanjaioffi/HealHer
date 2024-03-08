// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../domain/entities/entities.dart';

class WorkoutModel extends Equatable {
  String workoutName;
  String description;
  String videoUrl;
  String workoutSets;
  WorkoutModel({
    required this.workoutName,
    required this.description,
    required this.videoUrl,
    required this.workoutSets,
  });

  @override
  List<Object?> get props => [
        workoutName,
        description,
        videoUrl,
        workoutSets,
      ];

// map to  json
  Map<String, dynamic> toMap() {
    return {
      'workoutName': workoutName,
      'description': description,
      'videoUrl': videoUrl,
      'workoutSets': workoutSets,
    };
  }

  // map from json
  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      workoutName: map['exercise_name'].toString(),
      description: "map['description']",
      videoUrl: map['exercie_video'].toString(),
      workoutSets: "${map['exercise_reps']}X5",
    );
  }

  WorkoutEntity toEntity() {
    return WorkoutEntity(
      workoutName: workoutName,
      description: description,
      videoUrl: videoUrl,
      workoutSets: workoutSets,
    );
  }
}
