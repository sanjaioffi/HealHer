import 'package:heal_her/core/managers/interface/runtime_manager.dart';
import 'package:heal_her/core/managers/params/cache/cache_params.dart';
import 'package:heal_her/core/usecase/use_case.dart';

class WriteToCacheUseCase extends UseCase<dynamic, CacheWriteParams> {
  final RunTimeStorageCache runTimeStorageCache;

  WriteToCacheUseCase(this.runTimeStorageCache);

  @override
  Future call({CacheWriteParams? params}) async {
    await runTimeStorageCache.cacheData(
      params!.cacheKey,
      params.cacheValue,
    );
  }
}
