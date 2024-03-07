import '../../../usecase/use_case.dart';
import '../../interface/runtime_manager.dart';
import '../../params/cache/cache_params.dart';

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
