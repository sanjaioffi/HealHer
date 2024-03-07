import 'package:heal_her/core/usecase/use_case.dart';
import 'package:heal_her/features/food/domain/entity/diet.dart';
import 'package:heal_her/features/food/domain/repo/diet_repo.dart';

class FetchDietFromLocalStorageUseCase implements UseCase<List<Diet>, void> {
  final DietRepo dietRepo;

  FetchDietFromLocalStorageUseCase(this.dietRepo);

  @override
  Future<List<Diet>> call({void params}) async {
    return await dietRepo.getDietPlanFromLocal();
  }
}
