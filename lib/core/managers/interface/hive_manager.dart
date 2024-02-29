abstract class HiveManager {
  // Read from Hive
  Future<void> readFromHive(String key);

  // Write to Hive
  Future<void> writeToHive(String key, dynamic value);
}
