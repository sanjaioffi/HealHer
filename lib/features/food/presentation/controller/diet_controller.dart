import 'dart:developer';

import 'package:get/get.dart';

import '../../../../config/constants/constants.dart';
import '../../../../config/services/services.dart';
import '../../../../core/managers/params/cache/cache_params.dart';
import '../../../../core/managers/params/hive/hive_params.dart';
import '../../../../core/managers/usecase/cache/read_from_cache_use_case.dart';
import '../../../../core/managers/usecase/hive/write_to_hive_use_case.dart';
import '../../domain/entity/diet.dart';
import '../../domain/repo/diet_repo.dart';

class DietController extends GetxController {
  //
  final DietRepo dietRepo;

  //
  DietController(this.dietRepo);

  RxDouble caloriesRequired = 1000.0.obs;

  RxDouble currentCalories = 0.1.obs;

  RxDouble carbsRequired = 500.0.obs;

  RxDouble proteinRequired = 500.0.obs;

  RxDouble fatRequired = 100.0.obs;

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

    caloriesRequired.value = caloriesTotal.roundToDouble();

    //
    carbsRequired.value = carbTotal.roundToDouble();
    proteinRequired.value = proteinTotal.roundToDouble();
    fatRequired.value = fatTotal.roundToDouble();
  }

  void determineTimeOfDay() {
    final DateTime now = DateTime.now();

    final int hour = now.hour;

    if (hour < 12) {
      currentCalories.value = .3;
    } else if (hour > 12 && hour < 18) {
      currentCalories.value = .6;
    } else {
      currentCalories.value = 1.0;
    }
  }

  //
  Future<void> determineDietList() async {
    // Fetchind Data from the local database
    final List<Diet> result = await dietRepo.getDietPlanFromLocal();

    if (result.isNotEmpty) {
      //
      dietList = result;

      //
      log("The Data Cached ");
    } else {
      log("Sending Request to the remote database");

      final List<Map<String, dynamic>> dietMapList = [];

      final userData = await serviceLocator<ReadFromCacheUseCase>()
              .call(params: CacheFetchParams(cacheKey: "user_data"))
          as Map<String, dynamic>;

      //

      final result =
          await dietRepo.getDietPlanFromRemote(userData['userCalories']);

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
    determineTimeOfDay();
    update();
  }
}
