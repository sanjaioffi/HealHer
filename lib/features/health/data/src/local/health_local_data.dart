import '../../model/health_model.dart';

abstract class HealthLocalDataSrc {
  //
  Future<List<HealthModel>> getHealthRecommendationsFromLocalDataBase();
}
