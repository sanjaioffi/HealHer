import 'package:get/get.dart';

import '../../../../config/constants/constants.dart';
import '../../../../config/services/services.dart';
import '../../../../core/managers/params/hive/hive_params.dart';
import '../../../../core/managers/usecase/hive/read_from_hive_use_case.dart';

class ProfileController extends GetxController {
  //
  @override
  void onInit() async {
    await fetchUserProfile();
    super.onInit();
  }

  // User Profile Data
  late dynamic userProfileData;

  // Load the user profile
  Future<void> fetchUserProfile() async {
    //
    userProfileData = await serviceLocator<ReadFromHiveUseCase>().call(
      params: HiveRetrieveParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDataReference,
      ),
    );

    update();
  }
}
