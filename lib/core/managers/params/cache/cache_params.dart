abstract class CacheParams {
  final String cacheKey;
  CacheParams({
    required this.cacheKey,
  });
}

class CacheFetchParams extends CacheParams {
  CacheFetchParams({required super.cacheKey});
}

class CacheWriteParams extends CacheParams {
  final dynamic cacheValue;

  CacheWriteParams({
    required super.cacheKey,
    required this.cacheValue,
  });
}
