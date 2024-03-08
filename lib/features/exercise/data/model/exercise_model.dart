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
  factory ExerciseModel.fromMap(dynamic map) {
    return ExerciseModel(
      workoutName: map['exercise_name'].toString(),
      description: "map['description']",
      videoUrl: map['exercie_video'].toString(),
      workoutSets: "${map['exercise_reps']}X5",
    );
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
