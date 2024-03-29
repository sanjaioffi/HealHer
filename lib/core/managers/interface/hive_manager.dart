abstract class HiveManager {
  // Initialise Hive Boxes
  Future<void> initialiseHiveBox(String boxName);

  // Read from Hive
  Future readFromHive(String boxName, key);

  // Write to Hive
  Future<void> writeToHive(String boxName, key, dynamic value);

  //
  Future<void> deleteFromHive(String boxName, key);
}
