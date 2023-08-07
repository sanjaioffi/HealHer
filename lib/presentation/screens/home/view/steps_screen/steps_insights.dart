import 'package:flutter/material.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';
import 'package:intl/intl.dart';

class HeartData {
  final String day;
  final int heartRate;

  HeartData(this.day, this.heartRate);
}

class StepInsightsScreen extends StatefulWidget {
  const StepInsightsScreen({super.key});

  @override
  State<StepInsightsScreen> createState() => _StepInsightsScreenState();
}

class _StepInsightsScreenState extends State<StepInsightsScreen> {
  final List<HeartData> weekHeartData = [
    HeartData("Sun", 70),
    HeartData("Mon", 80),
    HeartData("Tue", 85),
    HeartData("Wed", 90),
    HeartData("Thu", 75),
    HeartData("Fri", 95),
    HeartData("Sat", 78),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WeekData(weekHeartData: weekHeartData),
            ],
          ),
        ),
      ),
    );
  }
}

class WeekData extends StatelessWidget {
  const WeekData({
    super.key,
    required this.weekHeartData,
  });

  final List<HeartData> weekHeartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
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
        rows: weekHeartData.map((data) {
          return DataRow(cells: [
            DataCell(DateFormat('E').format(DateTime.now()) == data.day
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColor.purplyBlue,
                        borderRadius: BorderRadius.circular(10)),
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
                : Text(
                    data.day,
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                    ),
                  )),
            DataCell(Text(
              '${data.heartRate.toString()} bpm',
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '${data.heartRate.toString()} bpm',
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
