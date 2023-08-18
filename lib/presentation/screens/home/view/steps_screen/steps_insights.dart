import 'package:flutter/material.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';
import 'package:intl/intl.dart';

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

class StepInsightsScreen extends StatefulWidget {
  const StepInsightsScreen({super.key});

  @override
  State<StepInsightsScreen> createState() => _StepInsightsScreenState();
}

class _StepInsightsScreenState extends State<StepInsightsScreen> {
  final List<HeartData> weekHeartData = [
    HeartData("Sun", 70, 70),
    HeartData("Mon", 80, 80),
    HeartData("Tue", 85, 85),
    HeartData("Wed", 90, 90),
    HeartData("Thu", 75, 75),
    HeartData("Fri", 95, 95),
    HeartData("Sat", 78, 78),
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

  final List<StepData> weekStepData = [
    StepData("Sun", 7000),
    StepData("Mon", 8000),
    StepData("Tue", 8500),
    StepData("Wed", 9000),
    StepData("Thu", 7500),
    StepData("Fri", 9500),
    StepData("Sat", 7800),
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DoubleWeekData(weekData: weekHeartData, suffix: 'bpm'),
              DoubleWeekData(weekData: weekSpo2Data, suffix: '%'),
              SingleWeekData(weekData: weekStepData, suffix: 'Steps'),
              SingleWeekData(weekData: weekKcalData, suffix: 'Kcal'),
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

class DoubleMonthData extends StatelessWidget {
  const DoubleMonthData(
      {super.key, required this.weekData, required this.suffix});

  final List weekData;
  final String suffix;

  @override
  Widget build(BuildContext context) {
  

    int getWeekOfMonth() {
      DateTime date = DateTime.now();
      final beginningOfMonth = DateTime(date.year, date.month);
      final firstDayOfFirstWeek = beginningOfMonth.weekday;
      final offset = (date.day + firstDayOfFirstWeek - 2) ~/ 7;
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
