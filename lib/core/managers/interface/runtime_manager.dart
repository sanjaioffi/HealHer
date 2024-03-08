abstract class RunTimeStorageCache {
  //
  Future getCache(String cacheKey);

  //
  Future<void> cacheData(String cacheKey, dynamic cacheData);
}
