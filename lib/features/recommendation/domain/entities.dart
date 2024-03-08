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
