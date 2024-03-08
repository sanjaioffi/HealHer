import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../utils/extra.dart';
import '../utils/snackbar.dart';

class ScanController extends GetxController {
  final RxList<BluetoothDevice> systemDevices = <BluetoothDevice>[].obs;
  final RxList<ScanResult> scanResults = <ScanResult>[].obs;
  final RxBool isScanning = false.obs;
  final Rx<BluetoothDevice?> selectedDevice = Rx<BluetoothDevice?>(null);
  final RxList<BluetoothService> services = <BluetoothService>[].obs;
  late StreamSubscription<List<ScanResult>> _scanResultsSubscription;
  late StreamSubscription<bool> _isScanningSubscription;

  @override
  void onInit() {
    onScanPressed();
    _scanResultsSubscription = FlutterBluePlus.scanResults.listen((results) {
      scanResults.assignAll(results);
      Get.log('Scan Results: $results');
      autoConnect();
    }, onError: (e) {
      Snackbar.show(ABC.b, prettyException("Scan Error:", e), success: false);
    });

    _isScanningSubscription = FlutterBluePlus.isScanning.listen((state) {
      isScanning.value = state;
    });

    super.onInit();
  }

  @override
  void onClose() {
    _scanResultsSubscription.cancel();
    _isScanningSubscription.cancel();
    super.onClose();
  }

  // Connect to a device with a specific MAC address
  void autoConnect() {
    // write a code to store the previous connected device to store the MAC address in the database and create a button to remove the device from the database
    var box = Hive.box('device');
    String specificMac = box.get('selectedDevice') ?? '84:0F:2A:3D:A1:30';

    final deviceToConnect = scanResults
        .firstWhereOrNull(
          (result) => result.device.remoteId.toString() == specificMac,
        )
        ?.device;

    if (deviceToConnect != null && selectedDevice.value == null) {
      onConnectPressed(deviceToConnect);
    }
  }

  void checkConnnetedDevices() {
    for (var device in FlutterBluePlus.connectedDevices) {
      print('Connected Device: ${device.advName} - ${device.remoteId}');
    }
  }

  Future<void> onScanPressed() async {
    try {
      systemDevices.value = await FlutterBluePlus.systemDevices;
    } catch (e) {
      Snackbar.show(ABC.b, prettyException("System Devices Error:", e),
          success: false);
    }
    try {
      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));
    } catch (e) {
      Snackbar.show(ABC.b, prettyException("Start Scan Error:", e),
          success: false);
    }
  }

  Future<void> onStopPressed() async {
    try {
      FlutterBluePlus.stopScan();
    } catch (e) {
      Snackbar.show(ABC.b, prettyException("Stop Scan Error:", e),
          success: false);
    }
  }

  void onConnectPressed(BluetoothDevice device) {
    device.connectAndUpdateStream().catchError((e) {
      Snackbar.show(ABC.c, prettyException("Connect Error:", e),
          success: false);
    });

    Get.find<ScanController>().selectedDevice.value = device;
    var box = Hive.box('device');
    box.put('selectedDevice', device.remoteId.toString());

    Get.find<ScanController>().services.clear();
    device
        .discoverServices()
        .then((value) => Get.find<ScanController>().services.addAll(value));

    // Get.to(() => DeviceScreen(device: device));

    Get.showSnackbar(GetSnackBar(
      title: 'Device Connected',
      message: 'You are now connected to ${device.advName}',
      duration: const Duration(seconds: 3),
    ));
  }

  Future onCancelPressed(BluetoothDevice device) async {
    try {
      await device.disconnectAndUpdateStream(queue: false);
      Get.find<ScanController>().selectedDevice.value = null;
      var box = Hive.box('device');
      box.put('selectedDevice', null);
      Snackbar.show(ABC.c, "Cancel: Success", success: true);
    } catch (e) {
      Snackbar.show(ABC.c, prettyException("Cancel Error:", e), success: false);
    }
  }

  Future<void> onRefresh() async {
    if (!isScanning.value) {
      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));
    }
    autoConnect();
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
