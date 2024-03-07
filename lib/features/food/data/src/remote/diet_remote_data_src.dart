import 'package:heal_her/features/food/data/model/diet_model.dart';

abstract class DietRemoteDataSrc {
  Future<List<DietModel>> fetchDiet(double calories);
}
