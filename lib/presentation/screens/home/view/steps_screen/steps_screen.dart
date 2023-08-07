import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../utils/app_colors.dart';

class StepsScreen extends StatefulWidget {
  const StepsScreen({super.key});

  @override
  State<StepsScreen> createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  int currentIndex = 0;
  final List<double> dailystepss = [5000, 8000, 9000, 10000, 8500, 7000, 6000];
  final List<double> weeklystepss = [5000, 8000, 9000, 10000, 8500, 7000, 6000];
  final List<double> monthlystepss = [
    9000,
    10000,
    5000,
    8000,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_back_ios_rounded),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.lightPurplrBlue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: Text(
                          'Insight',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'DAILY STEPS',
                style: TextStyle(
                    color: AppColor.purplyBlue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "You have walked ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '40%',
                        style: TextStyle(
                          color: AppColor.purplyBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' of your goal',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                      color: AppColor.purplyBlue,
                    ),
                    Text("7254",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      'steps',
                      style: TextStyle(
                          color: Colors.black,
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 8.0,
                      animation: true,
                      animationDuration: 1000,
                      percent: 0.7,
                      animateFromLastPercent: true,
                      center: Image.asset(
                        'assets/images/kcal.png',
                        width: 25,
                        height: 25,
                        color: AppColor.bluishCyan,
                      ),
                      footer: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "31 KCAl",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppColor.bluishCyan,
                      backgroundColor: AppColor.bluishCyanLight,
                    ),
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 8.0,
                      animation: true,
                      animationDuration: 1000,
                      percent: 0.5,
                      animateFromLastPercent: true,
                      center: const Icon(
                        Icons.pin_drop_rounded,
                        size: 30,
                        color: AppColor.babyPurplyBlue,
                      ),
                      footer: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "2 km",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppColor.babyPurplyBlue,
                      backgroundColor: AppColor.lightPurplrBlue,
                    ),
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 8.0,
                      animation: true,
                      animationDuration: 1000,
                      percent: 0.3,
                      animateFromLastPercent: true,
                      center: const Icon(
                        Icons.timelapse_outlined,
                        size: 30,
                        color: AppColor.blue,
                      ),
                      footer: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "50 min",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppColor.blue,
                      backgroundColor: AppColor.blueLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: double.infinity,
              //     height: 230,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(40),
              //         color: AppColor.purplyBlue),
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(16.0),
              //           child: SizedBox(
              //             width: MediaQuery.of(context).size.width / 1.5,
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 InkWell(
              //                   onTap: () {
              //                     setState(() {
              //                       currentIndex = 0;
              //                     });
              //                   },
              //                   child: Container(
              //                     decoration: BoxDecoration(
              //                         color: currentIndex == 0
              //                             ? AppColor.heavyPurplyBlue
              //                             : AppColor.purplyBlue,
              //                         borderRadius: BorderRadius.circular(10)),
              //                     child: const Padding(
              //                       padding: EdgeInsets.all(8.0),
              //                       child: Text(
              //                         'DAY',
              //                         style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.bold,
              //                             letterSpacing: 1),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 InkWell(
              //                   onTap: () {
              //                     setState(() {
              //                       currentIndex = 1;
              //                     });
              //                   },
              //                   child: Container(
              //                     decoration: BoxDecoration(
              //                         color: currentIndex == 1
              //                             ? AppColor.heavyPurplyBlue
              //                             : AppColor.purplyBlue,
              //                         borderRadius: BorderRadius.circular(10)),
              //                     child: const Padding(
              //                       padding: EdgeInsets.all(8.0),
              //                       child: Text(
              //                         'WEEK',
              //                         style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.bold,
              //                             letterSpacing: 1),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 InkWell(
              //                   onTap: () {
              //                     setState(() {
              //                       currentIndex = 2;
              //                     });
              //                   },
              //                   child: Container(
              //                     decoration: BoxDecoration(
              //                         color: currentIndex == 2
              //                             ? AppColor.heavyPurplyBlue
              //                             : AppColor.purplyBlue,
              //                         borderRadius: BorderRadius.circular(10)),
              //                     child: const Padding(
              //                       padding: EdgeInsets.all(8.0),
              //                       child: Text(
              //                         'MONTH',
              //                         style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.bold,
              //                             letterSpacing: 1),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //         Container(
              //             height: 150,
              //             width: double.infinity,
              //             child: currentIndex == 0
              //                 ? buildBarChart(dailystepss, 'Day')
              //                 : currentIndex == 1
              //                     ? buildBarChart(weeklystepss, 'Week')
              //                     : buildBarChart(monthlystepss, 'Month'))
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBarChart(List<double> data, String label) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 10000,
        titlesData: FlTitlesData(
            show: true,
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: label == 'Day'
                    ? getDayTitles
                    : label == 'Week'
                        ? getWeekTitles
                        : getMonthTitles,
                reservedSize: 38,
              ),
            )),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: AppColor.heavyPurplyBlue,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final steps = rod.toY.toInt();
              return BarTooltipItem(
                '$steps steps',
                const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
        barGroups: data.asMap().entries.map((entry) {
          final index = entry.key;
          final value = entry.value;
          return BarChartGroupData(x: index, barRods: [
            BarChartRodData(
              width: 10,
              color: AppColor.heavyPurplyBlue,
              toY: value,
            ),
          ]);
        }).toList(),
      ),
    ),
  );
}

Widget getDayTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('M', style: style);
      break;
    case 1:
      text = const Text('T', style: style);
      break;
    case 2:
      text = const Text('W', style: style);
      break;
    case 3:
      text = const Text('T', style: style);
      break;
    case 4:
      text = const Text('F', style: style);
      break;
    case 5:
      text = const Text('S', style: style);
      break;
    case 6:
      text = const Text('S', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}

Widget getWeekTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('M', style: style);
      break;
    case 1:
      text = const Text('T', style: style);
      break;
    case 2:
      text = const Text('W', style: style);
      break;
    case 3:
      text = const Text('T', style: style);
      break;
    case 4:
      text = const Text('F', style: style);
      break;
    case 5:
      text = const Text('S', style: style);
      break;
    case 6:
      text = const Text('S', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}

Widget getMonthTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black,
    // fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('WEEK 1', style: style);
      break;
    case 1:
      text = const Text('WEEK 2', style: style);
      break;
    case 2:
      text = const Text('WEEK 3', style: style);
      break;
    case 3:
      text = const Text('WEEK 4', style: style);
      break;

    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}
