import 'dart:developer';

import 'package:get/get.dart';
import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/managers/usecase/hive/write_to_hive_use_case.dart';
import 'package:heal_her/features/food/domain/entity/diet.dart';
import 'package:heal_her/features/food/domain/repo/diet_repo.dart';

class DietController extends GetxController {
  //
  final DietRepo dietRepo;

  //
  DietController(this.dietRepo);

  RxDouble caloriesRequired = 1000.0.obs;

  RxInt currentCalories = 0.obs;

  RxDouble carbsRequired = 1000.0.obs;

  RxDouble proteinRequired = 1000.0.obs;

  RxDouble fatRequired = 1000.0.obs;

  List<Diet> dietList = <Diet>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await determineDietList();
  }

  void calculateDietDetails() {
    double caloriesTotal = 0.0;

    //
    double carbTotal = 0.0;
    double proteinTotal = 0.0;
    double fatTotal = 0.0;

    for (Diet dietEntity in dietList) {
      caloriesTotal += dietEntity.sessionCalories;
      carbTotal += dietEntity.sessionCarbs;
      proteinTotal += dietEntity.sessionProtein;
      fatTotal += dietEntity.sessionFat;
    }

    caloriesRequired.value = (caloriesTotal / 1000).roundToDouble();

    //
    carbsRequired.value = carbTotal.roundToDouble();
    proteinRequired.value = proteinTotal.roundToDouble();
    fatRequired.value = fatTotal.roundToDouble();
  }

  void determineTimeOfDay() {
    final DateTime now = DateTime.now();

    final int hour = now.hour;

    if (hour < 12) {
      currentCalories.value = 0;
    } else if (hour > 12 && hour < 18) {
      currentCalories.value = 1;
    }
    currentCalories.value = 2;
  }

  //
  Future<void> determineDietList() async {
    // Fetchind Data from the local database
    final List<Diet> result = await dietRepo.getDietPlanFromLocal();

    if (result.isNotEmpty) {
      dietList = result;
      log("The Data Cached ");
    } else {
      final List<Map<String, dynamic>> dietMapList = [];

      final result = await dietRepo.getDietPlanFromRemote(1200);

      for (Diet diet in result) {
        dietMapList.add(diet.toMap());
      }

      await serviceLocator<WriteToHiveUseCase>().call(
        params: HiveAddParams(
          hiveBoxName: userBoxReference,
          hiveKey: userDietReference,
          data: dietMapList,
        ),
      );

      dietList = result;
    }
    calculateDietDetails();
    update();
  }
}
