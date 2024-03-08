import 'package:heal_her/features/health/data/model/health_model.dart';

abstract class HealthRemoteDataSrc {
  Future<List<HealthModel>> getHealthRecommendationFromRemote();
}
