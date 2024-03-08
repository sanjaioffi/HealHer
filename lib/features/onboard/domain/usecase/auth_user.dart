import '../../../../config/constants/constants.dart';
import '../../../../core/managers/params/cache/cache_params.dart';
import '../../../../core/managers/params/hive/hive_params.dart';
import '../../../../core/managers/usecase/cache/write_to_cache_use_case.dart';
import '../../../../core/managers/usecase/hive/read_from_hive_use_case.dart';
import '../../../../core/usecase/use_case.dart';

class AuthenticateUserCase implements UseCase<dynamic, void> {
  final ReadFromHiveUseCase readFromHiveUseCase;
  final WriteToCacheUseCase writeToCacheUseCase;

  AuthenticateUserCase(this.readFromHiveUseCase, this.writeToCacheUseCase);

  @override
  Future call({void params}) async {
    final result = await readFromHiveUseCase.call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDataReference,
      ),
    );

    if (result != null) {
      return result;
    }
    return false;
  }
}
