import 'dart:developer';

import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/core/managers/params/hive/hive_params.dart';
import 'package:heal_her/core/managers/usecase/hive/write_to_hive_use_case.dart';
import 'package:heal_her/features/health/data/model/health_model.dart';
import 'package:heal_her/features/health/data/src/local/health_local_data.dart';
import 'package:heal_her/features/health/data/src/remote/health_remote_data_src.dart';
import 'package:heal_her/features/health/domain/entity/health_entity.dart';
import 'package:heal_her/features/health/domain/repo/health_repo.dart';

class HealthRepoImpl implements HealthRepo {
  //
  final HealthRemoteDataSrc healthRemoteDataSrc;
  final HealthLocalDataSrc healthLocalDataSrc;

  HealthRepoImpl(this.healthLocalDataSrc, this.healthRemoteDataSrc);

  List<HealthEntity> convertHealthModelToHealth(List<HealthModel> healthModel) {
    //
    final List<HealthEntity> healthEntities = [];
    for (var health in healthModel) {
      healthEntities.add(HealthEntity.fromHealthModel(health));
    }
    return healthEntities;
  }

  @override
  Future<List<HealthEntity>> getHealthRecommendations() async {
    //
    final List<HealthEntity> healthEntities = [];

    final List<HealthModel> response =
        await healthLocalDataSrc.getHealthRecommendationsFromLocalDataBase();

    if (response.isNotEmpty) {
      log("Cache Info found. Sending...");
      return convertHealthModelToHealth(response);
    }

    log("Not found in Local DataBase");

    final remoteResponse =
        await healthRemoteDataSrc.getHealthRecommendationFromRemote();

    if (remoteResponse.isNotEmpty) {
      log("Response Recieved from Remote Impl to Repo Impl");

      final List<Map<String, dynamic>> cacheData = [];

      //
      for (var health in remoteResponse) {
        //
        cacheData.add(health.toMap());

        //
        await serviceLocator<WriteToHiveUseCase>().call(
          params: HiveAddParams(
            hiveBoxName: userBoxReference,
            hiveKey: userHealthReference,
            data: cacheData,
          ),
        );

        log("Sucessfully Written Everything to local database");
      }

      // Iterate response and convert it to Health and add it healthEntities
      return convertHealthModelToHealth(remoteResponse);
    }

    return healthEntities;
  }
}
