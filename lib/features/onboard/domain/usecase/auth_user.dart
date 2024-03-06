import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/core/managers/params/cache/cache_params.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/managers/usecase/cache/write_to_cache_use_case.dart';
import 'package:heal_her/core/managers/usecase/hive/read_from_hive_use_case.dart';
import 'package:heal_her/core/usecase/use_case.dart';

class AuthenticateUserCase implements UseCase<bool, void> {
  final ReadFromHiveUseCase readFromHiveUseCase;
  final WriteToCacheUseCase writeToCacheUseCase;

  AuthenticateUserCase(this.readFromHiveUseCase, this.writeToCacheUseCase);

  @override
  Future<bool> call({void params}) async {
    final result = await readFromHiveUseCase.call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDataReference,
      ),
    );
    if (result != null) {
      await writeToCacheUseCase.call(
        params: CacheWriteParams(
          cacheKey: 'user_data',
          cacheValue: result,
        ),
      );
      return true;
    }
    return false;
  }
}
