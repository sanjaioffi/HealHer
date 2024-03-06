import 'package:heal_her/core/managers/interface/hive_manager.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/usecase/use_case.dart';

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
