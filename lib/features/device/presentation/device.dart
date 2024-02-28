import 'package:flutter/material.dart';
import 'package:heal_her/config/theme/app_colors.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
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
                          const Text(
                            'HealHer SmartBand',
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 23,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: 'MAC',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                    )),
                                TextSpan(
                                    text: '  -  ',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                    )),
                                TextSpan(
                                    text: "00-B0-D0-63-C2-26",
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                    )),
                              ])),
                          const SizedBox(height: 10),
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: 'Battery',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                    )),
                                TextSpan(
                                    text: '  -  ',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                    )),
                                TextSpan(
                                    text: "100%",
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                    )),
                              ])),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColor.lightPurplrBlue,
                        child: Icon(
                          Icons.watch,
                          color: AppColor.heavyPurplyBlue,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ]),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
