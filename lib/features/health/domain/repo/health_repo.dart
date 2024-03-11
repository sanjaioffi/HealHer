import '../entity/health_entity.dart';

abstract class HealthRepo {
  Future<List<HealthEntity>> getHealthRecommendations();
}
