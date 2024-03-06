import 'package:heal_her/core/managers/interface/runtime_manager.dart';

class RunTimeStorageCacheImpl implements RunTimeStorageCache {
  final Map<String, dynamic> _cache;

  RunTimeStorageCacheImpl() : _cache = <String, dynamic>{};

  @override
  Future<void> cacheData(String cacheKey, cacheData) async {
    _cache[cacheKey] = cacheData;
  }

  @override
  Future getCache(String cacheKey) async {
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey];
    }
    return null;
  }
}
