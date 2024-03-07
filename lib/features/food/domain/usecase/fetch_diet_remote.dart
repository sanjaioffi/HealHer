import 'package:heal_her/core/usecase/use_case.dart';
import 'package:heal_her/features/food/domain/entity/diet.dart';

import '../repo/diet_repo.dart';

class FetchDiet implements UseCase<List<Diet>, DietParams> {
  final DietRepo dietRepo;
  FetchDiet(this.dietRepo);

  @override
  Future<List<Diet>> call({DietParams? params}) async {
    return await dietRepo.getDietPlanFromRemote(params!.calories);
  }
}

class DietParams {
  final double calories;

  DietParams({required this.calories});
}
