import 'package:get/get.dart';
import '../../../config/constants/constants.dart';
import '../../../config/services/services.dart';
import '../../../core/managers/params/hive/hive_params.dart';
import '../../../core/managers/usecase/hive/read_from_hive_use_case.dart';

class PeriodTrackerController extends GetxController {
  var lastPeriodData = DateTime(1900).obs;

  var periodCycle = 200.obs;

  @override
  void onInit() async {
    //
    super.onInit();
    await loadPeriodData();
  }

  Future<void> loadPeriodData() async {
    final result = await serviceLocator<ReadFromHiveUseCase>().call(
        params: HiveRetrieveParams(
      hiveBoxName: userBoxReference,
      hiveKey: userDataReference,
    ));
    final userLastPeriodDate = result['userLastPeriodDate'];
    final userPeriodCycle = result['userPeriodCycle'];

    lastPeriodData.value = userLastPeriodDate;
    periodCycle.value = userPeriodCycle;
    update();
  }
}
