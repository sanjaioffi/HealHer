abstract class HiveManager {
  // Initialise Hive Boxes
  Future<void> initialiseHiveBox(String boxName);

  // Read from Hive
  Future<void> readFromHive(String boxName, key);

  // Write to Hive
  Future<void> writeToHive(String boxName, key, dynamic value);
}
