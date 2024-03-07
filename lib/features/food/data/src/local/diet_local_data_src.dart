import 'package:heal_her/features/food/data/model/diet_model.dart';

abstract class DietLocalDataSrc {
  Future<List<DietModel>> retrieveDietPlan();
}
