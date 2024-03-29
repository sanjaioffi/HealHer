import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import '../../../../config/constants/constants.dart';

abstract class DataSource {
  Future update();
}

class DataSourceImp implements DataSource {
  @override
  Future update() async {
    var collectionName = "userData";
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(collectionName);
    collection.find().forEach((element) {
      inspect(element);
    });
  }
}







// ✓  Built build/app/outputs/flutter-apk/app-debug.apk.
