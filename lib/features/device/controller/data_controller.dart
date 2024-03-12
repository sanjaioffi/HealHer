import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'scan_controller.dart';

class DataController extends GetxController {
  final RxString heartRate = '0'.obs;
  final RxList heartRateList = [].obs;

  final RxString spo2 = '0'.obs;
  final RxList spo2List = [].obs;

  final RxString bpSys = '0'.obs;
  final RxList bpSysList = [].obs;

  final RxString bpDys = '0'.obs;
  final RxList bpDysList = [].obs;

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
    Get.find<DataController>().heartRateList.clear();
    Get.find<DataController>().spo2List.clear();
    Get.find<DataController>().bpSysList.clear();
    Get.find<DataController>().bpDysList.clear();

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

    Get.find<DataController>().heartRateList.add(int.parse(hr.toString()));
    Get.find<DataController>().spo2List.add(int.parse(spo2.toStringAsFixed(0)));
    Get.find<DataController>().bpSysList.add(int.parse(sys.toString()));
    Get.find<DataController>().bpDysList.add(int.parse(dia.toString()));
  }

 

  void findAvgHeartRate() {
    List<int> heartRates = Get.find<DataController>()
        .heartRateList
        .map((rate) => int.parse(rate))
        .toList();

    List<int> filteredHeartRates =
        heartRates.where((rate) => rate >= 40 && rate <= 180).toList();

    double averageHeartRate =
        filteredHeartRates.reduce((a, b) => a + b) / filteredHeartRates.length;

    Get.find<DataController>().heartRate.value =
        averageHeartRate.toStringAsFixed(0);
    var box = Hive.box('data');
    box.put('heartRate', averageHeartRate.toStringAsFixed(0));
  }

  
  void findAvgSpo2() {
    List<int> spo2s = Get.find<DataController>()
        .spo2List
        .map((rate) => int.parse(rate))
        .toList();

    List<int> filteredSpo2s =
        spo2s.where((rate) => rate >= 90 && rate <= 100).toList();

    double averageSpo2 =
        filteredSpo2s.reduce((a, b) => a + b) / filteredSpo2s.length;

    Get.find<DataController>().spo2.value = averageSpo2.toStringAsFixed(0);
    var box = Hive.box('data');
    box.put('spo2', averageSpo2.toStringAsFixed(0));
  }

  void findAvgBpSys() {
    List<int> bpSys = Get.find<DataController>()
        .bpSysList
        .map((rate) => int.parse(rate))
        .toList();

    List<int> filteredBpSys =
        bpSys.where((rate) => rate >= 90 && rate <= 140).toList();

    double averageBpSys =
        filteredBpSys.reduce((a, b) => a + b) / filteredBpSys.length;

    Get.find<DataController>().bpSys.value = averageBpSys.toStringAsFixed(0);
    var box = Hive.box('data');
    box.put('sys', averageBpSys.toStringAsFixed(0));
  }

  void findAvgBpDys() {
    List<int> bpDys = Get.find<DataController>()
        .bpDysList
        .map((rate) => int.parse(rate))
        .toList();

    List<int> filteredBpDys =
        bpDys.where((rate) => rate >= 60 && rate <= 90).toList();

    double averageBpDys =
        filteredBpDys.reduce((a, b) => a + b) / filteredBpDys.length;

    Get.find<DataController>().bpDys.value = averageBpDys.toStringAsFixed(0);
    var box = Hive.box('data');
    box.put('dia', averageBpDys.toStringAsFixed(0));
  }

  void saveAvgInLocalDay(){
    var box = Hive.box('day ${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}');
    List<int> heartRates = box.get('heartRates', defaultValue: []);
    List<int> spo2s = box.get('spo2s', defaultValue: []);
    List<int> syss = box.get('syss', defaultValue: []);
    List<int> dias = box.get('dias', defaultValue: []);

    heartRates.add(int.parse(heartRate.value));
    spo2s.add(int.parse(spo2.value));
    syss.add(int.parse(bpSys.value));
    dias.add(int.parse(bpDys.value));

    box.put('heartRates', heartRates);
    box.put('spo2s', spo2s);
    box.put('syss',syss);
    box.put('dias', dias);
  }



  void sendCommand(String command, {String? data}) {

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

    if (data == 'hrps') {
        findAvgHeartRate();
        findAvgSpo2();
        findAvgBpSys();
        findAvgBpDys();


      
    }
  }
}
