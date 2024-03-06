import 'package:heal_her/core/managers/interface/runtime_manager.dart';
import 'package:heal_her/core/managers/params/cache/cache_params.dart';
import 'package:heal_her/core/usecase/use_case.dart';

class ReadFromCacheUseCase implements UseCase<dynamic, CacheFetchParams> {
  final RunTimeStorageCache runTimeStorageCache;

  ReadFromCacheUseCase(this.runTimeStorageCache);

  @override
  Future call({CacheFetchParams? params}) async {
    return await runTimeStorageCache.getCache(params!.cacheKey);
  }
}
