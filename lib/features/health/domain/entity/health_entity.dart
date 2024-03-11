import '../../data/model/health_model.dart';

class HealthEntity {
  final String healthIssue;
  final List<dynamic> healthRecommendations;

  HealthEntity({
    required this.healthIssue,
    required this.healthRecommendations,
  });

  // Generate a HealthEntity from a HealthModel
  factory HealthEntity.fromHealthModel(HealthModel health) {
    return HealthEntity(
      healthIssue: health.healthIssue,
      healthRecommendations: health.healthRecommendations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'healthIssue': healthIssue,
      'healthRecommendations': healthRecommendations,
    };
  }
}
