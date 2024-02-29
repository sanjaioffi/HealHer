// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WorkoutDetailEntity extends Equatable {
  final String workoutName;
  final String description;
  final String videoUrl;
  final String kcal;
  final String duration;
  final List<String> equipment;

  const WorkoutDetailEntity(
      {required this.workoutName,
      required this.description,
      required this.videoUrl,
      required this.kcal,
      required this.duration,
      required this.equipment});

  @override
  List<Object?> get props =>
      [workoutName, description, videoUrl, kcal, duration, equipment];
}

class WorkoutEntity extends Equatable {
  final String workoutType;
  final int workoutCount;
  final String workoutImageUrl;
  final List<WorkoutDetailEntity> workoutDetails;
  const WorkoutEntity({
    required this.workoutType,
    required this.workoutCount,
    required this.workoutImageUrl,
    required this.workoutDetails,
  });

  @override
  List<Object?> get props =>
      [workoutType, workoutCount, workoutDetails, workoutImageUrl];
}
