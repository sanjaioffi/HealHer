import '../../../usecase/use_case.dart';
import '../../interface/hive_manager.dart';
import '../../params/hive/hive_params.dart';

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
