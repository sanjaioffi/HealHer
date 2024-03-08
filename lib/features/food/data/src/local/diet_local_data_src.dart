import '../../model/diet_model.dart';

abstract class DietLocalDataSrc {
  Future<List<DietModel>> retrieveDietPlan();
}
