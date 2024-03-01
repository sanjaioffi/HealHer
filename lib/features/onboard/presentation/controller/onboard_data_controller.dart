import 'dart:developer';

import 'package:get/get.dart';
import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/core/managers/interface/hive_manager.dart';

class OnboardDataController extends GetxController {
  final HiveManager hiveManager;

  OnboardDataController({required this.hiveManager});

  RxBool isUpdated = false.obs;

  Future<void> updateUserDataToHive() async {
    await hiveManager.writeToHive(
        userBoxReference, userDataReference, userEntity.toMap());

    log("Verifyinh Write");

    await verifyData();
    isUpdated.value = true;
    update();
  }

  Future<void> verifyData() async {
    final result =
        await hiveManager.readFromHive(userBoxReference, userDataReference);

    log(result.toString());
  }
}
