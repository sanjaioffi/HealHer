// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:heal_her/presentation/utils/app_colors.dart';

// class HeartRateChartScreen extends StatelessWidget {
  // final List<double> dailyHeartRates = [75, 80, 85, 90, 95, 100, 110];
  // final List<double> weeklyHeartRates = [
  //   80,
  //   85,
  //   90,
  //   95,
  // ];
  // final List<double> monthlyHeartRates = [
  //   90,
  //   95,
  //   100,
  //   105,
  //   110,
  //   115,
  //   120,
  //   100,
  //   105,
  //   110,
  //   115,
  //   120
  // ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Heart Rate Chart')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text('Day',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               buildBarChart(dailyHeartRates, 'Day'),
//               const SizedBox(height: 30),
//               const Text('Week',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               buildBarChart(weeklyHeartRates, 'Week'),
//               const SizedBox(height: 30),
//               const Text('Month',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               buildBarChart(monthlyHeartRates, 'Month'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  
