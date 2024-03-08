import 'dart:developer';

import 'package:get/get.dart';
import 'package:heal_her/features/health/domain/entity/health_entity.dart';
import 'package:heal_her/features/health/domain/repo/health_repo.dart';

class HealthController extends GetxController {
  final HealthRepo repository;

  HealthController(this.repository);

  RxList healthRecommendaions = <HealthEntity>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getHealth();
  }

  Future<void> getHealth() async {
    //

    final List<HealthEntity> health =
        await repository.getHealthRecommendations();

    log("Recieved this shit in the controller : ${health.toString()}");

    //
    healthRecommendaions.value = health;
    update();
  }
}
