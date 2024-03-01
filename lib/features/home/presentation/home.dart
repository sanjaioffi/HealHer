import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/features/blood_pressure/presentation/blood_pressure.dart';
import 'package:heal_her/features/heart/presentation/heart.dart';
import 'package:heal_her/features/step/presentation/step.dart';
import 'package:heal_her/features/step/presentation/widgets/steps_insights.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../config/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColor.heavyPurplyBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cloud_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const Text(
                        'HealHer',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CircularPercentIndicator(
                    // center: DottedBorder(
                    //     borderType: BorderType.Circle,
                    //     dashPattern: const [5, 10],
                    //     child: Container(
                    //       height: 150,
                    //       width: 150,
                    //       decoration: const BoxDecoration(shape: BoxShape.circle),
                    //     )),
                    center: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_walk_rounded,
                          size: 50,
                          color: AppColor.white,
                        ),
                        Text("7254",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          'steps',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    radius: 110.0,
                    animation: true,
                    animationDuration: 1000,
                    lineWidth: 15.0,
                    percent: 0.9,
                    reverse: false,
                    arcType: ArcType.FULL,
                    startAngle: 0.0,
                    animateFromLastPercent: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: AppColor.lightPurplrBlue,
                    progressColor: AppColor.purplyBlue,
                    arcBackgroundColor: AppColor.lightPurplrBlue,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Column(
                          children: [
                            Text(
                              'STEP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 2),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '8000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                            width: 50,
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              'DISTANCE',
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            RichText(
                                text: const TextSpan(
                                    text: '5.0',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                    children: [
                                  TextSpan(
                                    text: ' km',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                ])),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                            width: 50,
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              'HEAT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            RichText(
                                text: const TextSpan(
                                    text: '0.0',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                    children: [
                                  TextSpan(
                                    text: ' Kcal',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                ])),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
          const SizedBox(height: 20),
          SizedBox(
            height: 500,
            child: GridView.extent(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                maxCrossAxisExtent: 200.0, // maximum item width
                mainAxisSpacing: 16.0, // spacing between rows
                crossAxisSpacing: 16.0, // spacing between columns
                padding: const EdgeInsets.all(8.0), // padding around the grid
                children: [
                  DataTile(
                    icon: Icon(
                      Icons.water_drop,
                      color: AppColor.spo2Indicator,
                      size: 30,
                    ),
                    nextScreen: Heart(),
                    backgroundColor: AppColor.spo2,
                    title: 'Spo2',
                    body: CircularPercentIndicator(
                      lineWidth: 7.0,
                      radius: 50,
                      percent: 0.7,
                      progressColor: AppColor.spo2Indicator,
                      backgroundColor: AppColor.spo2Indicator.withOpacity(0.2),
                      center: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('90%',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  DataTile(
                    icon: Icon(
                      Icons.favorite,
                      color: AppColor.heavyPurplyBlue,
                      size: 30,
                    ),
                    nextScreen: Heart(),
                    backgroundColor: AppColor.heart,
                    title: 'Heart Rate',
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/png/heart_rate.png',
                          color: AppColor.heavyPurplyBlue,
                          fit: BoxFit.cover,
                          height: 60,
                          width: 170,
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: const TextSpan(
                                  text: '120',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: [
                                TextSpan(
                                    text: ' bpm',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Colors.black54))
                              ])),
                        ),
                      ],
                    ),
                  ),
                  DataTile(
                    icon: Icon(
                      Icons.medical_information,
                      color: AppColor.bloodPressure,
                      size: 30,
                    ),
                    nextScreen: BloodPressure(),
                    backgroundColor: AppColor.bloodPressure,
                    title: 'Blood Pressure',
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/png/blood-pressure.png',
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: const TextSpan(
                                  text: '120/80',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: [
                                TextSpan(
                                    text: ' mmHg',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        color: Colors.black54))
                              ])),
                        ),
                      ],
                    ),
                  ),
                  // DataTile(
                  //   nextScreen: Heart(),
                  //   backgroundColor: AppColor.heart,
                  //   title: 'ECG',
                  //   body: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Image.asset(
                  //         'assets/png/heart_rate.png',
                  //         color: AppColor.heavyPurplyBlue,
                  //         fit: BoxFit.cover,
                  //         height: 60,
                  //         width: 170,
                  //       ),
                  //       const SizedBox(height: 10),
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: RichText(
                  //             text: const TextSpan(
                  //                 text: '120',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Poppins',
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.black),
                  //                 children: [
                  //               TextSpan(
                  //                   text: ' bpm',
                  //                   style: TextStyle(
                  //                       fontFamily: 'Poppins',
                  //                       fontSize: 12,
                  //                       color: Colors.black54))
                  //             ])),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  DataTile(
                    icon: Icon(
                      Icons.directions_walk_rounded,
                      color: AppColor.stepsIndicator,
                      size: 30,
                    ),
                    nextScreen: StepsScreen(),
                    backgroundColor: AppColor.steps,
                    title: 'Steps',
                    body: CircularPercentIndicator(
                      lineWidth: 7.0,
                      radius: 50,
                      percent: 0.7,
                      progressColor: AppColor.stepsIndicator,
                      backgroundColor: AppColor.stepsIndicator.withOpacity(0.2),
                      center: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('1234',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('Steps', style: TextStyle(fontSize: 15))
                        ],
                      ),
                    ),
                  ),
                  // DataTile(),
                  // DataTile(),
                ]),
          )
        ],
      ),
    );
  }
}

class DataTile extends StatelessWidget {
  const DataTile(
      {super.key,
      required this.backgroundColor,
      required this.title,
      required this.body,
      required this.nextScreen,
      required this.icon});

  final Color backgroundColor;
  final String title;
  final Widget body;
  final Widget nextScreen;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => nextScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                icon
              ],
            ),
            const SizedBox(height: 20),
            body,
          ],
        ),
      ),
    );
  }
}
