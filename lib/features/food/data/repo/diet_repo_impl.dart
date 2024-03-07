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

    //
    final List<DietModel> dietModels =
        await dietRemoteDataSrc.fetchDiet(calories);

    for (DietModel dietModel in dietModels) {
      dietEntity.add(Diet.fromDietModel(dietModel));
    }

    return dietEntity;
  }

  @override
  Future<List<Diet>> getDietPlanFromLocal() {
    // TODO: implement getDietPlanFromLocal
    throw UnimplementedError();
  }
}
