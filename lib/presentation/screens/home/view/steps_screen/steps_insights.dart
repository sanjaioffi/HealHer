import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/home/view/heart_widgets/widget/back_ground.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';
import 'package:intl/intl.dart';

import '../../../../common/screen_utils/screen_size.dart';

class HeartData {
  final String day;
  final int min;
  final int max;

  HeartData(this.day, this.min, this.max);
}

class Spo2Data {
  final String day;
  final int min;
  final int max;

  Spo2Data(this.day, this.min, this.max);
}

class StepData {
  final String day;
  final int value;

  StepData(this.day, this.value);
}

class KcalData {
  final String day;
  final int value;

  KcalData(this.day, this.value);
}

class SleepData {
  final String day;
  final int value;

  SleepData(this.day, this.value);
}

final List<HeartData> weekHeartData = [
  HeartData("Sun", 70, 70),
  HeartData("Mon", 80, 80),
  HeartData("Tue", 85, 85),
  HeartData("Wed", 90, 90),
  HeartData("Thu", 75, 75),
  HeartData("Fri", 95, 95),
  HeartData("Sat", 78, 78),
];

final List<HeartData> monthHeartData = [
  HeartData("Week 1", 70, 70),
  HeartData("Week 2", 80, 80),
  HeartData("Week 3", 85, 85),
  HeartData("Week 4", 90, 90),
  // HeartData("Thu", 75, 75),
  // HeartData("Fri", 95, 95),
  // HeartData("Sat", 78, 78),
];

final List<Spo2Data> weekSpo2Data = [
  Spo2Data("Sun", 90, 70),
  Spo2Data("Mon", 85, 80),
  Spo2Data("Tue", 85, 85),
  Spo2Data("Wed", 90, 90),
  Spo2Data("Thu", 75, 75),
  Spo2Data("Fri", 95, 95),
  Spo2Data("Sat", 78, 78),
];

final List<Spo2Data> monthSpo2Data = [
  Spo2Data("Week 1", 90, 70),
  Spo2Data("Week 2", 85, 80),
  Spo2Data("Week 3", 85, 85),
  Spo2Data("Week 4", 90, 90),
];

final List<StepData> weekStepData = [
  StepData("Sun", 7000),
  StepData("Mon", 8000),
  StepData("Tue", 8500),
  StepData("Wed", 9000),
  StepData("Thu", 7500),
  StepData("Fri", 9500),
  StepData("Sat", 7800),
];
final List<StepData> monthStepData = [
  StepData("Week 1", 7000),
  StepData("Week 2", 8000),
  StepData("Week 3", 8500),
  StepData("Week 4", 9000),
];

final List<KcalData> weekKcalData = [
  KcalData("Sun", 170),
  KcalData("Mon", 180),
  KcalData("Tue", 185),
  KcalData("Wed", 190),
  KcalData("Thu", 175),
  KcalData("Fri", 195),
  KcalData("Sat", 178),
];
final List<KcalData> monthKcalData = [
  KcalData("Week 1", 170),
  KcalData("Week 2", 180),
  KcalData("Week 3", 185),
  KcalData("Week 4", 190),
];

class StepInsightsScreen extends StatefulWidget {
  const StepInsightsScreen({super.key});

  @override
  State<StepInsightsScreen> createState() => _StepInsightsScreenState();
}

class _StepInsightsScreenState extends State<StepInsightsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DisclaimerText(),
              dayHeartRate(),
              DoubleWeekData(weekData: weekHeartData, suffix: 'bpm'),
              DoubleMonthData(monthData: monthHeartData, suffix: 'bpm'),
              DoubleWeekData(weekData: weekSpo2Data, suffix: '%'),
              DoubleMonthData(monthData: monthSpo2Data, suffix: '%'),
              SingleWeekData(weekData: weekStepData, suffix: 'Steps'),
              SingleMonthData(monthData: monthStepData, suffix: 'Steps'), //---
              SingleWeekData(weekData: weekKcalData, suffix: 'Kcal'),
              SingleMonthData(monthData: monthKcalData, suffix: 'Kcal'), //--
            ],
          ),
        ),
      ),
    );
  }
}

class DoubleWeekData extends StatelessWidget {
  const DoubleWeekData(
      {super.key, required this.weekData, required this.suffix});

  final List weekData;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        headingTextStyle: TextStyle(color: AppColor.black, fontSize: 16),
        headingRowHeight: 40,
        headingRowColor: MaterialStateColor.resolveWith(
            (states) => AppColor.purplyBlue.withOpacity(0.2)),
        columns: <DataColumn>[
          DataColumn(
            label: Text('This Week'),
          ),
          DataColumn(
            label: Text('Min'),
          ),
          DataColumn(
            label: Text('Max'),
          ),
        ],
        rows: weekData.map((data) {
          return DataRow(cells: [
            DataCell(DateFormat('E').format(DateTime.now()) == data.day
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColor.purplyBlue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Text(
                        data.day,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )),
            DataCell(Text(
              '${data.min.toString()} $suffix',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '${data.max.toString()} $suffix',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ]);
        }).toList(),
      ),
    );
  }
}

// current line

class DisclaimerText extends StatelessWidget {
  const DisclaimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: AppColor.black,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: RichText(
                overflow: TextOverflow.visible,
                text: TextSpan(
                    text: 'Disclaimer: ',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Not intendented for medical or diagnostic purposes. ',
                        style: TextStyle(
                            color: AppColor.black.withOpacity(0.5),
                            fontSize: 15),
                      )
                    ])),
          ),
        ],
      ),
    );
  }
}

class dayHeartRate extends StatelessWidget {
  const dayHeartRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(screenWidth(15)),
        padding: EdgeInsets.all(screenWidth(20)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth(25)),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.centerRight,
            colors: [AppColor.lightPurplrBlue, Colors.white60],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Heart Rate',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('70', style: TextStyle(fontSize: 15)),
                      Text('Latest', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('--', style: TextStyle(fontSize: 15)),
                      Text('Min.', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('--', style: TextStyle(fontSize: 15)),
                      Text('Avg.', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('--', style: TextStyle(fontSize: 15)),
                      Text('Max.', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DoubleMonthData extends StatelessWidget {
  const DoubleMonthData(
      {super.key, required this.monthData, required this.suffix});

  final List monthData;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    int getWeekOfMonth() {
      DateTime date = DateTime.now();
      final beginningOfMonth = DateTime(date.year, date.month);
      final firstDayOfFirstWeek = beginningOfMonth.weekday;
      final offset = (date.day + firstDayOfFirstWeek - 2) ~/ 7;
      // print(offset + 1);
      // print('Week 3'.split(' '));
      return offset + 1;
    }

    return SizedBox(
      width: double.infinity,
      child: DataTable(
        headingTextStyle: TextStyle(color: AppColor.black, fontSize: 16),
        headingRowHeight: 40,
        headingRowColor: MaterialStateColor.resolveWith(
            (states) => AppColor.purplyBlue.withOpacity(0.2)),
        columns: <DataColumn>[
          DataColumn(
            label: Text('This Month'),
          ),
          DataColumn(
            label: Text('Min'),
          ),
          DataColumn(
            label: Text('Max'),
          ),
        ],
        rows: monthData.map((data) {
          return DataRow(cells: [
            DataCell(getWeekOfMonth().toString() == data.day.split(' ')[1]
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColor.purplyBlue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Text(
                        data.day,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Text(
                        data.day,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )),
            DataCell(Text(
              '${data.min.toString()} $suffix',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '${data.max.toString()} $suffix',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ]);
        }).toList(),
      ),
    );
  }
}

class SingleWeekData extends StatelessWidget {
  const SingleWeekData(
      {super.key, required this.weekData, required this.suffix});

  final List weekData;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        headingTextStyle: TextStyle(color: AppColor.black, fontSize: 16),
        headingRowHeight: 40,
        headingRowColor: MaterialStateColor.resolveWith(
            (states) => AppColor.purplyBlue.withOpacity(0.2)),
        columns: <DataColumn>[
          DataColumn(
            label: Text('This Week'),
          ),
          DataColumn(
            label: Text(suffix),
          ),
        ],
        rows: weekData.map((data) {
          return DataRow(cells: [
            DataCell(DateFormat('E').format(DateTime.now()) == data.day
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColor.purplyBlue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Text(
                        data.day,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )),
            DataCell(Text(
              '${data.value.toString()} $suffix',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ]);
        }).toList(),
      ),
    );
  }
}

class SingleMonthData extends StatelessWidget {
  const SingleMonthData(
      {super.key, required this.monthData, required this.suffix});

  final List monthData;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    int getWeekOfMonth() {
      DateTime date = DateTime.now();
      final beginningOfMonth = DateTime(date.year, date.month);
      final firstDayOfFirstWeek = beginningOfMonth.weekday;
      final offset = (date.day + firstDayOfFirstWeek - 2) ~/ 7;
      // print('single');
      // print(offset + 1);
      // print('Week 3'.split(' ')[1]);
      return offset + 1;
    }

    return SizedBox(
      width: double.infinity,
      child: DataTable(
        headingTextStyle: TextStyle(color: AppColor.black, fontSize: 16),
        headingRowHeight: 40,
        headingRowColor: MaterialStateColor.resolveWith(
            (states) => AppColor.purplyBlue.withOpacity(0.2)),
        columns: <DataColumn>[
          DataColumn(
            label: Text('This Month'),
          ),
          DataColumn(
            label: Text(suffix),
          ),
        ],
        rows: monthData.map((data) {
          return DataRow(cells: [
            DataCell(getWeekOfMonth().toString() == data.day.split(' ')[1]
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColor.purplyBlue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Text(
                        data.day,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Text(
                        data.day,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )),
            DataCell(Text(
              '${data.value.toString()} $suffix',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ]);
        }).toList(),
      ),
    );
  }
}
