import '../entity/diet.dart';

abstract class DietRepo {
  Future<List<Diet>> getDietPlanFromRemote(double calories);

  Future<List<Diet>> getDietPlanFromLocal();
}
