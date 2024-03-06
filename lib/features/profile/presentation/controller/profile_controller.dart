import 'dart:developer';

import 'package:get/get.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/core/managers/params/cache/cache_params.dart';
import 'package:heal_her/core/managers/usecase/cache/read_from_cache_use_case.dart';

class ProfileController extends GetxController {
  //
  @override
  void onInit() async {
    log("Fetching Profile Data...");
    await fetchUserProfile();
    super.onInit();
  }

  // User Profile Data
  late dynamic userProfileData;

  // Load the user profile
  Future<void> fetchUserProfile() async {
    userProfileData = await serviceLocator<ReadFromCacheUseCase>().call(
      params: CacheFetchParams(cacheKey: "user_data"),
    );

    log(userProfileData.toString());
  }
}
