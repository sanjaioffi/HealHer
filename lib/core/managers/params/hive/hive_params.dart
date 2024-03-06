// Hive Delete parameters from hive
abstract class HiveParams {
  final String hiveBoxName;
  final String hiveKey;

  HiveParams({required this.hiveBoxName, required this.hiveKey});
}

class HiveAddParams extends HiveParams {
  final dynamic data;

  //
  HiveAddParams({
    required super.hiveBoxName,
    required super.hiveKey,
    required this.data,
  });
}

class HiveRetrieveParams extends HiveParams {
  //
  HiveRetrieveParams({
    required super.hiveBoxName,
    required super.hiveKey,
  });
}

class HiveDeleteParams extends HiveParams {
  final String hiveBoxKey;

  //
  HiveDeleteParams({
    required super.hiveBoxName,
    required super.hiveKey,
    required this.hiveBoxKey,
  });
}
