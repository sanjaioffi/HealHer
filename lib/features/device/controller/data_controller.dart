import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'scan_controller.dart';
import 'package:hive/hive.dart';

class DataController extends GetxController {
  final RxString heartRate = '0'.obs;
  final RxList heartRateList = [].obs;

  final RxString spo2 = '0'.obs;
  final RxList spo2List = [].obs;

  final RxString bpSys = '0'.obs;
  final RxString bpDys = '0'.obs;

  final RxString ecg = '0'.obs;

  // UUIDS

  final String commandServiceUUID = "1450dbb0-e48c-4495-ae90-5ff53327ede4";
  final String commandCharacteristicUUID =
      "9393c756-78ea-4629-a53e-52fb10f9a63f";

  final String hrpsServiceUUID = 'f2f9a4de-ef95-4fe1-9c2e-ab5ef6f0d6e9';
  final String hrpsCharacteristicUUID = '9e8fafe1-8966-4276-a3a3-d0b00269541e';

  void getData() {
    var box = Hive.box('data');
    heartRate.value = box.get('heartRate', defaultValue: '78');
    spo2.value = box.get('spo2', defaultValue: '90');
    bpSys.value = box.get('sys', defaultValue: '120');
    bpDys.value = box.get('dia', defaultValue: '80');
  }

  void updateEcg() {
    Get.find<ScanController>()
        .selectedDevice
        .value!
        .discoverServices()
        .then((value) {
      for (BluetoothService service in value) {
        if (service.uuid.toString() == hrpsServiceUUID) {
          for (BluetoothCharacteristic characteristic
              in service.characteristics) {
            if (characteristic.uuid.toString() == hrpsCharacteristicUUID) {
              characteristic.setNotifyValue(true);
              characteristic.lastValueStream.listen((value) {
                // Decode the received data as a UTF-8 string
                print(value);
                String stringValue = utf8.decode(value);
                ecg.value = stringValue;
                print('ECG: $stringValue');
              });
            }
          }
        }
      }
    });
  }

  void updateHrps() {
    Get.find<ScanController>()
        .selectedDevice
        .value!
        .discoverServices()
        .then((value) {
      for (BluetoothService service in value) {
        if (service.uuid.toString() == hrpsServiceUUID) {
          for (BluetoothCharacteristic characteristic
              in service.characteristics) {
            if (characteristic.uuid.toString() == hrpsCharacteristicUUID) {
              characteristic.setNotifyValue(true);
              characteristic.lastValueStream.listen((value) {
                // Decode the received data as a UTF-8 string
                String stringValue = utf8.decode(value);
                updateValues(stringValue);

                // You can perform any other actions with the received string here
              });
            }
          }
        }
      }
    });
  }

  void updateValues(String data) {
    List<String> keyValuePairs = data.split(',');

    Map<String, dynamic> parsedData = {};

    for (String pair in keyValuePairs) {
      List<String> keyValuePair = pair.split('=');
      if (keyValuePair.length == 2) {
        String key = keyValuePair[0].trim();
        String value = keyValuePair[1].trim();

        dynamic parsedValue =
            int.tryParse(value) ?? double.tryParse(value) ?? value;
        parsedData[key] = parsedValue;
      }
    }

    int? hr = parsedData['hr'];
    double? spo2 = parsedData['spo2'];
    int? sys = parsedData['sys'];
    int? dia = parsedData['dia'];

    print('Heart Rate: $hr, SpO2: $spo2%, Sys: $sys, Dia: $dia');
    Get.find<DataController>().heartRate.value = hr.toString();
    Get.find<DataController>().spo2.value = spo2!.toStringAsFixed(0);
    Get.find<DataController>().bpSys.value = sys.toString();
    Get.find<DataController>().bpDys.value = dia.toString();

    var box = Hive.box('data');
    box.put('heartRate', hr.toString());
    box.put('spo2', spo2.toStringAsFixed(0));
    box.put('sys', sys.toString());
    box.put('dia', dia.toString());
  }

  // void updateHeartRate() {
  //   Get.find<DataController>().heartRateList.value = [];

  //   for (BluetoothService service in Get.find<ScanController>().services) {
  //     if (service.uuid.toString() == heartRateServiceUUID) {
  //       for (BluetoothCharacteristic characteristic
  //           in service.characteristics) {
  //         if (characteristic.uuid.toString() == heartRateCharacteristicUUID) {
  //           characteristic.setNotifyValue(true);
  //           characteristic.read().then((value) {
  //             Get.find<DataController>().heartRate.value =
  //                 utf8.decode(value).toString();
  //             Get.find<DataController>().heartRateList.add(utf8.decode(value));
  //           });
  //         }
  //       }
  //     }
  //   }

  //   findAvgHeartRate();
  // }

  // void findAvgHeartRate() {
  //   List<int> heartRates = Get.find<DataController>()
  //       .heartRateList
  //       .map((rate) => int.parse(rate))
  //       .toList();

  //   List<int> filteredHeartRates =
  //       heartRates.where((rate) => rate >= 40 && rate <= 180).toList();

  //   double averageHeartRate =
  //       filteredHeartRates.reduce((a, b) => a + b) / filteredHeartRates.length;

  //   Get.find<DataController>().heartRate.value =
  //       averageHeartRate.toStringAsFixed(0);
  //   var box = Hive.box('data');
  //   box.put('heartRate', averageHeartRate.toStringAsFixed(0));
  // }

  // void updateSpo2() {
  //   Get.find<DataController>().spo2List.value = [];
  //   for (BluetoothService service in Get.find<ScanController>().services) {
  //     if (service.uuid.toString() == spo2ServiceUUID) {
  //       for (BluetoothCharacteristic characteristic
  //           in service.characteristics) {
  //         if (characteristic.uuid.toString() == spo2CharacteristicUUID) {
  //           characteristic.setNotifyValue(true);
  //           characteristic.read().then((value) {
  //             Get.find<DataController>().spo2.value =
  //                 utf8.decode(value).toString();
  //           });
  //         }
  //       }
  //     }
  //   }

  //   findAvgSpo2();
  // }

  // void findAvgSpo2() {
  //   List<int> spo2s = Get.find<DataController>()
  //       .spo2List
  //       .map((rate) => int.parse(rate))
  //       .toList();

  //   List<int> filteredSpo2s =
  //       spo2s.where((rate) => rate >= 90 && rate <= 100).toList();

  //   double averageSpo2 =
  //       filteredSpo2s.reduce((a, b) => a + b) / filteredSpo2s.length;

  //   Get.find<DataController>().spo2.value = averageSpo2.toStringAsFixed(0);
  //   var box = Hive.box('data');
  //   box.put('spo2', averageSpo2.toStringAsFixed(0));
  // }

  void sendCommand(String command) {
    Get.find<ScanController>()
        .selectedDevice
        .value!
        .discoverServices()
        .then((value) {
      for (BluetoothService service in value) {
        if (service.uuid.toString() == commandServiceUUID) {
          for (BluetoothCharacteristic characteristic
              in service.characteristics) {
            if (characteristic.uuid.toString() == commandCharacteristicUUID) {
              characteristic.write(utf8.encode(command));
              print('Command sent: $command');
            }
          }
        }
      }
    });

    switch (command) {
      case 'hrps':
        updateHrps();
        break;
      case 'ecg':
        updateEcg();
        break;
    }
  }
}
