import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../../config/constants/constants.dart';
import '../../../../config/services/services.dart';
import '../../../../core/managers/params/cache/cache_params.dart';
import '../../../../core/managers/params/hive/hive_params.dart';
import '../../../../core/managers/usecase/cache/write_to_cache_use_case.dart';
import '../../../../core/managers/usecase/hive/write_to_hive_use_case.dart';

class OnboardDataController extends GetxController {
  RxBool isUpdated = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await updateUserDataToHive();
  }

  Future<void> updateUserDataToHive() async {
    //
    Map<String, dynamic> userEntityData = userEntity.toMap();

    await serviceLocator<WriteToHiveUseCase>().call(
      params: HiveAddParams(
        hiveBoxName: userBoxReference,
        hiveKey: userDataReference,
        data: userEntityData,
      ),
    );

    await serviceLocator<WriteToCacheUseCase>().call(
      params: CacheWriteParams(
        cacheKey: 'user_data',
        cacheValue: userEntityData,
      ),
    );

    isUpdated.value = true;
    _update(userEntityData);
    update();
  }
}

Future _update(Map<String, dynamic> map) async {
  var collectionName = "userData";
  var db = await Db.create(MONGO_URL);
  await db.open();
  var collection = db.collection(collectionName);
  collection.insert(map);
}

var MONGO_PASS = "mohanasundharam";
var MONGO_USER = "mohanasundharam";
var MONGO_DATABASE = "HealHerDataBase";

var MONGO_URL =
    "mongodb+srv://$MONGO_USER:$MONGO_PASS@cluster0.vmuahl9.mongodb.net/$MONGO_DATABASE?retryWrites=true&w=majority&appName=Cluster0";
