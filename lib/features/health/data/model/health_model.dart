class HealthModel {
  final String healthIssue;
  final List<dynamic> healthRecommendations;

  HealthModel({
    required this.healthIssue,
    required this.healthRecommendations,
  });

  // Generate a HealthModel from a json
  factory HealthModel.fromJson(dynamic json) {
    return HealthModel(
      healthIssue: json['healthIssue'],
      healthRecommendations: json['healthRecommendations'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'healthIssue': healthIssue,
      'healthRecommendations': healthRecommendations,
    };
  }
}
