import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_time_chart/real_time_chart.dart';

import '../../../config/theme/app_colors.dart';
import '../controller/data_controller.dart';

class ECGGraph extends StatefulWidget {
  @override
  State<ECGGraph> createState() => _ECGGraphState();
}

class _ECGGraphState extends State<ECGGraph> {
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColor.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text('ECG Graph', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.heavyPurplyBlue,
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColor.white,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GetBuilder<DataController>(
                        builder: (_) {
                          return RealTimeGraph(stream: positiveDataStream());
                        },
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ECG Instructions',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                        'Before taking ECG reading, please follow these instructions:'),
                    const SizedBox(height: 20),
                    Text(
                        'Step 1: Place your finger on the plate near the display.'),
                    const SizedBox(height: 10),
                    Text(
                        'Step 2: Ensure that your finger is in proper contact with the plate.'),
                    const SizedBox(height: 10),
                    Text(
                        'Step 3: Relax and try to keep your finger still during the reading.'),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            dataController.sendCommand('ecg_stop');
                            Get.dialog(
                              AlertDialog(
                                title: const Text("ECG Stopped"),
                                content: const Text(
                                    "ECG reading has been stopped successfully."),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                      Get.back();
                                    },
                                    child: const Text('Close',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text('Stop ECG',
                              style: TextStyle(color: Colors.white))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<double> positiveDataStream() {
    return Stream.periodic(const Duration(milliseconds: 500), (_) {
      return double.parse(dataController.ecg.value);
    }).asBroadcastStream();
  }
}
