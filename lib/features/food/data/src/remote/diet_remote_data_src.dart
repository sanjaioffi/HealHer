import '../../model/diet_model.dart';

abstract class DietRemoteDataSrc {
  Future<List<DietModel>> fetchDiet(double calories);
}
