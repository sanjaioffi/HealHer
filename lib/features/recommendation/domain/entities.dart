// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WorkoutDetailEntity extends Equatable {
  final String workoutName;
  final String description;
  final String videoUrl;
  final String workoutSets;

  const WorkoutDetailEntity({
    required this.workoutName,
    required this.description,
    required this.videoUrl,
    required this.workoutSets,
  });

  @override
  List<Object?> get props => [workoutName, description, videoUrl, workoutSets];
}

class WorkoutEntity extends Equatable {
  final String workoutType;
  final String workoutLevel;

  final int workoutItemCount;
  final String workoutImageUrl;
  final int workoutDuration;
  final List<WorkoutDetailEntity> workoutDetails;
  const WorkoutEntity({
    required this.workoutType,
    required this.workoutLevel,
    required this.workoutItemCount,
    required this.workoutImageUrl,
    required this.workoutDuration,
    required this.workoutDetails,
  });
  @override
  List<Object?> get props => [
        workoutType,
        workoutLevel,
        workoutItemCount,
        workoutImageUrl,
        workoutDuration,
        workoutDetails
      ];
}
