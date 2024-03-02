import 'dart:developer';

import 'package:heal_her/config/constants/constants.dart';
import 'package:mongo_dart/mongo_dart.dart';

abstract class DataSource {
  Future update();
}

class DataSourceImp implements DataSource {
  @override
  Future update() async {
    var collectionName = "userData";
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var collection = db.collection(collectionName);
    collection.insertMany([
      {'login': 'jdoe', 'name': 'John Doe', 'email': 'john@doe.com'},
      {'login': 'lsmith', 'name': 'Lucy Smith', 'email': 'lucy@smith.com'}
    ]);
  }
}







// ✓  Built build/app/outputs/flutter-apk/app-debug.apk.
