import 'package:heal_her/features/food/domain/entity/diet.dart';

abstract class DietRepo {
  Future<List<Diet>> getDietPlanFromRemote(double calories);

  Future<List<Diet>> getDietPlanFromLocal();
}
