import '../../../usecase/use_case.dart';
import '../../interface/hive_manager.dart';
import '../../params/hive/hive_params.dart';

class WriteToHiveUseCase extends UseCase<void, HiveAddParams> {
  final HiveManager hiveManager;

  WriteToHiveUseCase(this.hiveManager);

  @override
  Future<void> call({HiveAddParams? params}) async {
    await hiveManager.writeToHive(
      params!.hiveBoxName,
      params.hiveKey,
      params.data,
    );
  }
}
