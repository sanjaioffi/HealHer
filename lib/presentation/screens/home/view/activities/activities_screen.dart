import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../utils/app_colors.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
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
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
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
                        SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                            width: 50,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'DISTANCE',
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                                    text: '5.0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                    children: [
                                  TextSpan(
                                    text: ' km',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                            width: 50,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'HEAT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                                    text: '0.0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                    children: [
                                  TextSpan(
                                    text: ' Kcal',
                                    style: TextStyle(
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
                  DataTile(
                    backgroundColor: AppColor.heart,
                    title: 'Heart Rate',
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/png/heart_rate.png',
                          color: AppColor.heavyPurplyBlue,
                          fit: BoxFit.cover,
                          height: 70,
                          width: 180,
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(
                                  text: '120',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: [
                                TextSpan(
                                    text: ' bpm',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54))
                              ])),
                        ),
                      ],
                    ),
                  ),
                  DataTile(
                    backgroundColor: AppColor.heart,
                    title: 'Heart Rate',
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/png/heart_rate.png',
                          color: AppColor.heavyPurplyBlue,
                          fit: BoxFit.cover,
                          height: 70,
                          width: 180,
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(
                                  text: '120',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: [
                                TextSpan(
                                    text: ' bpm',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54))
                              ])),
                        ),
                      ],
                    ),
                  ),
                  DataTile(
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
  DataTile({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.body,
  });

  Color backgroundColor;
  String title;
  Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Icon(
                Icons.directions_walk_rounded,
                color: AppColor.stepsIndicator,
                size: 30,
              ),
            ],
          ),
          const SizedBox(height: 20),
          body,
        ],
      ),
    );
  }
}
