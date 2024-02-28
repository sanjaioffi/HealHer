abstract class SharedPreferencesManager {
  // Fetch Data
  Future fetchDataFromSharedPreference(String dataKey);

  // Write Data
  Future<void> wirteDataToSharedPreference(String dataKey);
}
