import '../../../usecase/use_case.dart';
import '../../interface/hive_manager.dart';
import '../../params/hive/hive_params.dart';

class ReadFromHiveUseCase extends UseCase<dynamic, HiveRetrieveParams> {
  final HiveManager hiveManager;

  ReadFromHiveUseCase(this.hiveManager);

  @override
  Future call({HiveRetrieveParams? params}) async {
    return await hiveManager.readFromHive(
      params!.hiveBoxName,
      params.hiveKey,
    );
  }
}
