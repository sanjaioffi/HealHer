import 'package:get/get.dart';
import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/managers/usecase/hive/write_to_hive_use_case.dart';

class OnboardDataController extends GetxController {
  OnboardDataController();

  RxBool isUpdated = false.obs;

  @override
  void onInit() async {
    super.onInit();

    await updateUserDataToHive();
  }

  Future<void> updateUserDataToHive() async {
    //
    await serviceLocator<WriteToHiveUseCase>().call(
      params: HiveAddParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDataReference,
        data: userEntity.toMap(),
      ),
    );

    isUpdated.value = true;
    update();
  }
}
