import '../../../usecase/use_case.dart';
import '../../interface/runtime_manager.dart';
import '../../params/cache/cache_params.dart';

class ReadFromCacheUseCase implements UseCase<dynamic, CacheFetchParams> {
  final RunTimeStorageCache runTimeStorageCache;

  ReadFromCacheUseCase(this.runTimeStorageCache);

  @override
  Future call({CacheFetchParams? params}) async {
    return await runTimeStorageCache.getCache(params!.cacheKey);
  }
}
