import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../device/controller/data_controller.dart';
import 'home_stat_tile.dart';

class HomeHealthStat extends StatefulWidget {
  const HomeHealthStat({super.key});

  @override
  State<HomeHealthStat> createState() => _HomeHealthStatState();
}

class _HomeHealthStatState extends State<HomeHealthStat> {
  final DataController dataController = Get.find();
  @override
  void initState() {
    dataController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 15.w,
            right: 15.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeTileData(
                profileTileTitle: "AVG - HR",
                profileTileData: dataController.heartRate.value,
                profileTileSuffix: "BPM",
              ),
              HomeTileData(
                profileTileTitle: "AVG - BP",
                profileTileData:
                    "${dataController.bpSys.value}/${dataController.bpDys.value}",
                profileTileSuffix: "mmHg",
              ),
              HomeTileData(
                profileTileTitle: "AVG - SpO2",
                profileTileData: dataController.spo2.value.toString(),
                profileTileSuffix: "%",
                isLastTile: true,
              ),
            ],
          ),
        ));
  }
}
