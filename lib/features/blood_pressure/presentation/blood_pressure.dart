import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_colors.dart';
import '../../device/controller/data_controller.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({super.key});

  @override
  State<BloodPressure> createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  
  final DataController dataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx( () => Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.babyPurplyBlue,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          // title: const Text(
          //   'Blood Pressure',
          //   style: TextStyle(color: AppColor.black, fontWeight: FontWeight.w800),
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Measurement',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.black,
                      fontWeight: FontWeight.w700)),
              const Row(
                children: [
                  Icon(Icons.timelapse, color: AppColor.gery, size: 14),
                  Text(' 04 Feb, 09:00 AM',
                      style: TextStyle(fontSize: 14, color: AppColor.gery)),
                ],
              ),
              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 250.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: AppColor.white,
                  ),
                  child:  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(dataController.bpSys.value.toString(),
                            style: const TextStyle(
                                fontSize: 40,
                                color: AppColor.heavyPurplyBlue,
                                fontWeight: FontWeight.w700)),
                        const Text('Systolic',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColor.gery,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 20),
                        Text(dataController.bpDys.value.toString(),
                            style: const TextStyle(
                                fontSize: 40,
                                color: AppColor.heavyPurplyBlue,
                                fontWeight: FontWeight.w700)),
                        const Text('Diastolic',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColor.gery,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 200.w,
                  height: 50.h,
                  // height: 250.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.white,
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('PULSE',
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColor.gery,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite,
                          color: AppColor.heavyPurplyBlue, size: 20),
                      const SizedBox(width: 10),
                      Text(dataController.heartRate.value.toString(),
                          style: const TextStyle(
                              fontSize: 25,
                              color: AppColor.heavyPurplyBlue,
                              fontWeight: FontWeight.w700)),
                      const Text(
                        ' Bpm',
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColor.gery,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
