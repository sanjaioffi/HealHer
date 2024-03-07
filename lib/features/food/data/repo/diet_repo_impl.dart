import 'package:heal_her/features/food/data/model/diet_model.dart';
import 'package:heal_her/features/food/data/src/local/diet_local_data_src.dart';
import 'package:heal_her/features/food/data/src/remote/diet_remote_data_src.dart';
import 'package:heal_her/features/food/domain/entity/diet.dart';
import 'package:heal_her/features/food/domain/repo/diet_repo.dart';

class DietRepoImpl implements DietRepo {
  final DietRemoteDataSrc dietRemoteDataSrc;
  final DietLocalDataSrc dietLocalDataSrc;

  DietRepoImpl(
    this.dietRemoteDataSrc,
    this.dietLocalDataSrc,
  );

  @override
  Future<List<Diet>> getDietPlanFromRemote(double calories) async {
    final List<Diet> dietEntity = [];

    final dietModels = await dietRemoteDataSrc.fetchDiet(calories);

    if (dietModels.isEmpty) return dietEntity;

    for (DietModel dietModel in dietModels) {
      dietEntity.add(Diet.fromDietModel(dietModel));
    }

    return dietEntity;
  }

  @override
  Future<List<Diet>> getDietPlanFromLocal() async {
    final List<Diet> dietEntity = [];

    final result = await dietLocalDataSrc.retrieveDietPlan();

    for (DietModel dietModel in result) {
      dietEntity.add(Diet.fromDietModel(dietModel));
    }

    return dietEntity;
  }
}
