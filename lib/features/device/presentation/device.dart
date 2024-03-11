import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../config/theme/app_colors.dart';
import '../controller/data_controller.dart';
import '../controller/scan_controller.dart';
import 'available_devices.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final ScanController scanController = Get.find();

  final DataController dataController = Get.find();

  @override
  void initState() {
    dataController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final BluetoothDevice? device = scanController.selectedDevice.value;

      return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: AppColor.heavyPurplyBlue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 60),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      device == null
                                          ? 'Device Not Connected'
                                          : device.advName == ''
                                              ? 'Unknown Device'
                                              : device.advName,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 23,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'MAC',
                                            style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: 17,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          const TextSpan(
                                            text: '  -  ',
                                            style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: 17,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          TextSpan(
                                            text: device?.remoteId.toString() ??
                                                'Unknown',
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 17,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'Battery',
                                            style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: 17,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          const TextSpan(
                                            text: '  -  ',
                                            style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: 17,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          TextSpan(
                                            text: device != null
                                                ? '100%'
                                                : 'Unknown',
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 17,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    var box = Hive.box('device');
                                    var device = box.get('selectedDevice');
                                    print('device: $device');
                                  },
                                  onDoubleTap: () {
                                    device == null
                                        ? Get.snackbar('No device Found',
                                            'Device Not Connected')
                                        : Get.dialog(AlertDialog(
                                            title: const Text('Are you sure?'),
                                            content: const Text(
                                                'Do you want to disconnect the device?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  scanController
                                                      .onCancelPressed(device);
                                                  Get.back();
                                                },
                                                child: const Text('Yes'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text('No'),
                                              ),
                                            ],
                                          ));
                                  },
                                  child: Stack(children: [
                                    const CircleAvatar(
                                      radius: 30,
                                      backgroundColor: AppColor.lightPurplrBlue,
                                      child: Icon(
                                        Icons.watch,
                                        color: AppColor.heavyPurplyBlue,
                                        size: 40,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: device == null
                                            ? Colors.red
                                            : Colors.green,
                                        child: const Icon(
                                          Icons.bluetooth,
                                          color: AppColor.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),

                const Flexible(flex: 2, child: AvailableDevicesScreen()),

                // device != null
                //     ? Flexible(
                //         flex: 2,
                //         child: GridView(
                //           gridDelegate:
                //               const SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 2,
                //             crossAxisSpacing: 10,
                //             mainAxisSpacing: 10,
                //           ),
                //           shrinkWrap: true,
                //           children: [
                //             Container(
                //               padding: const EdgeInsets.all(10),
                //               decoration: BoxDecoration(
                //                 color: AppColor.heavyPurplyBlue,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   const Icon(
                //                     Icons.favorite,
                //                     color: AppColor.white,
                //                     size: 40,
                //                   ),
                //                   const Text(
                //                     'Heart Rate',
                //                     style: TextStyle(
                //                       color: AppColor.white,
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Text(dataController.heartRate.value,
                //                       style: const TextStyle(
                //                         color: AppColor.white,
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.bold,
                //                       )),
                //                 ],
                //               ),
                //             ),
                //             Container(
                //               padding: const EdgeInsets.all(10),
                //               decoration: BoxDecoration(
                //                 color: AppColor.heavyPurplyBlue,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   const Icon(
                //                     Icons.bloodtype,
                //                     color: AppColor.white,
                //                     size: 40,
                //                   ),
                //                   const Text(
                //                     'SpO2',
                //                     style: TextStyle(
                //                       color: AppColor.white,
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Text(dataController.spo2.value,
                //                       style: const TextStyle(
                //                         color: AppColor.white,
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.bold,
                //                       )),
                //                 ],
                //               ),
                //             ),
                //             Container(
                //               padding: const EdgeInsets.all(10),
                //               decoration: BoxDecoration(
                //                 color: AppColor.heavyPurplyBlue,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   const Icon(
                //                     Icons.favorite,
                //                     color: AppColor.white,
                //                     size: 40,
                //                   ),
                //                   const Text(
                //                     'Blood Pressure',
                //                     style: TextStyle(
                //                       color: AppColor.white,
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   Text(
                //                       '${dataController.bpSys.value}/${dataController.bpDys.value}',
                //                       style: const TextStyle(
                //                         color: AppColor.white,
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.bold,
                //                       )),
                //                 ],
                //               ),
                //             ),
                //             InkWell(
                //               onTap: () {
                //                 dataController.sendCommand('ecg');

                //                 // Get.to(() => ECGGraph());
                //               },
                //               child: Container(
                //                 padding: const EdgeInsets.all(10),
                //                 decoration: BoxDecoration(
                //                   color: AppColor.heavyPurplyBlue,
                //                   borderRadius: BorderRadius.circular(10),
                //                 ),
                //                 child: const Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Icon(
                //                       Icons.favorite,
                //                       color: AppColor.white,
                //                       size: 40,
                //                     ),
                //                     Text(
                //                       'ECG',
                //                       style: TextStyle(
                //                         color: AppColor.white,
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       )
                //     : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
