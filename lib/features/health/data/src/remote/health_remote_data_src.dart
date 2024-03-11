import '../../model/health_model.dart';

abstract class HealthRemoteDataSrc {
  Future<List<HealthModel>> getHealthRecommendationFromRemote();
}
