import 'dart:developer';

import 'package:heal_her/config/constants/constants.dart';
import 'package:heal_her/core/managers/interface/hive_manager.dart';
import 'package:heal_her/core/usecase/use_case.dart';

class AuthenticateUser implements UseCase<bool, void> {
  final HiveManager hiveManager;

  AuthenticateUser(this.hiveManager);

  @override
  Future<bool> call({void params}) async {
    final result =
        await hiveManager.readFromHive(userBoxReference, userDataReference);

    if (result != null) {
      log(result.toString());
      return true;
    }
    return false;
  }
}
