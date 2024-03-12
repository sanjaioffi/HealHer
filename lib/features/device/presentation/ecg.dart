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
      appBar: AppBar(backgroundColor: AppColor.heavyPurplyBlue, actions: [
        IconButton(
            onPressed: () {
              dataController.sendCommand('stop');
            },
            icon: const Icon(Icons.stop_circle_outlined)),
        IconButton(
          onPressed: () {
            dataController.updateEcg();
          },
          icon: const Icon(Icons.refresh),
        )
      ]),
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
