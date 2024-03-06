import 'package:heal_her/core/managers/interface/hive_manager.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/usecase/use_case.dart';

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
