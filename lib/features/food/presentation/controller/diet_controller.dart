import 'dart:developer';

import 'package:get/get.dart';
import 'package:heal_her/features/food/domain/entity/diet.dart';
import 'package:heal_her/features/food/domain/repo/diet_repo.dart';

class DietController extends GetxController {
  //
  final DietRepo dietRepo;
  DietController(this.dietRepo);

  final List<Diet> dietList = [];

  @override
  void onInit() async {
    super.onInit();
    await determineDietList();
  }

  //
  Future<void> determineDietList() async {
    final result = await dietRepo.getDietPlanFromLocal();

    log(result.toString());
  }
}
