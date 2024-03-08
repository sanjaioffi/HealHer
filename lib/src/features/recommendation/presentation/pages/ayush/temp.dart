class User {
  final int id;
  final String name;
  final int age;
  final String gender;
  final String location;
  final List<String> healthConditions;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.location,
    required this.healthConditions,
  });
}

class Treatment {
  final int id;
  final String name;
  final String description;
  final List<String> ingredients;
  final List<String> recommendedConditions;
  final List<String> contraindications;

  Treatment({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.recommendedConditions,
    required this.contraindications,
  });
}

double contentBasedSimilarity(User user, Treatment treatment) {
  // Calculate similarity between user profile and treatment based on attributes
  // like age, gender, location, health conditions, and recommended conditions
  double similarity = 0.0;

  // Calculate age similarity
  similarity += 1 - (user.age - 30).abs() / 30;

  // Check if gender matches
  if (user.gender == 'Male') {
    similarity += 0.2;
  }

  // Check if health conditions match recommended conditions
  for (String condition in user.healthConditions) {
    if (treatment.recommendedConditions.contains(condition)) {
      similarity += 0.2;
    }
  }

  // Normalize similarity score
  similarity = similarity / 1.2;

  return similarity;
}

List<Treatment> getRecommendations(User user, List<Treatment> treatments) {
  // Calculate similarity scores for all treatments
  final similarities = treatments.map((treatment) {
    final score = contentBasedSimilarity(user, treatment);
    return MapEntry(treatment, score);
  });

  // Sort treatments based on similarity scores
  final sortedSimilarities = similarities.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // Get top recommendations
  final recommendations = sortedSimilarities.take(5).map((entry) => entry.key);

  return recommendations.toList();
}

void main() {
  // Create a user
  final ayush = User(
    id: 1,
    name: 'Ayush',
    age: 32,
    gender: 'Male',
    location: 'Delhi',
    healthConditions: ['Stress', 'Insomnia'],
  );

  // Create some treatments
  final treatments = [
    Treatment(
      id: 1,
      name: 'Brahmi Ghritam',
      description: 'Herbal ghee preparation',
      ingredients: ['Brahmi', 'Ghee', 'Herbs'],
      recommendedConditions: ['Memory enhancement', 'Stress relief'],
      contraindications: [],
    ),
    Treatment(
      id: 2,
      name: 'Abhyanga Massage',
      description: 'Ayurvedic oil massage',
      ingredients: ['Herbal oils'],
      recommendedConditions: ['Insomnia', 'Muscle pain'],
      contraindications: [],
    ),
    // Add more treatments here
  ];

  // Get recommendations for Ayush
  final recommendations = getRecommendations(ayush, treatments);

  // Print recommendations
  print('Recommendations for ${ayush.name}:');
  for (Treatment treatment in recommendations) {
    print('- ${treatment.name}');
  }
}
