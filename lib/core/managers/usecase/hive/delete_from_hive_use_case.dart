import 'package:heal_her/core/managers/interface/hive_manager.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/usecase/use_case.dart';

class DeleteFromHiveUseCase extends UseCase<void, HiveDeleteParams> {
  final HiveManager hiveManager;

  DeleteFromHiveUseCase(this.hiveManager);

  @override
  Future<void> call({HiveDeleteParams? params}) async {
    await hiveManager.deleteFromHive(
      params!.hiveBoxName,
      params.hiveKey,
    );
  }
}
