import 'package:heal_her/features/health/data/model/health_model.dart';

abstract class HealthLocalDataSrc {
  //
  Future<List<HealthModel>> getHealthRecommendationsFromLocalDataBase();
}
