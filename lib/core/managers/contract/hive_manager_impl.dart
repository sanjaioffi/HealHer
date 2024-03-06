import 'package:hive/hive.dart';

import '../interface/hive_manager.dart';

class HiveManagerImpl implements HiveManager {
  final Map<String, Box> _hiveBoxes = {};

  @override
  Future<void> initialiseHiveBox(String boxName) async {
    if (!_hiveBoxes.containsKey(boxName)) {
      final Box hiveBox = await Hive.openBox(boxName);
      _hiveBoxes[boxName] = hiveBox;
    }
  }

  @override
  Future readFromHive(String boxName, key) async {
    final Box boxReference = _hiveBoxes[boxName]!;
    return await boxReference.get(key);
  }

  @override
  Future<void> writeToHive(String boxName, key, value) async {
    final Box boxReference = _hiveBoxes[boxName]!;
    await boxReference.put(key, value);
  }
}
