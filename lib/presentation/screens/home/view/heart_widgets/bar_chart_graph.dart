import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';

import '../../../../utils/app_colors.dart';

class _BarChart extends StatelessWidget {
  _BarChart();

  final List<int> nums = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(groupsSpace: 20,
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(
          show: false,
        ),
        alignment: BarChartAlignment.spaceAround,
        maxY: 200,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    text = nums[value.toInt()].toString();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  double get barWidth => screenWidth(10);

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          AppColor.purplyBlue.withAlpha(20),
          AppColor.heavyPurplyBlue.withGreen(4),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => List.generate(10, (index) {
        return BarChartGroupData(barsSpace: 50,
          x: index,
          barRods: [
            BarChartRodData(
              width: barWidth,
              toY: random(60, 160).toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        );
      });
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

class HeartBarChart extends StatefulWidget {
  const HeartBarChart({super.key});

  @override
  State<StatefulWidget> createState() => HeartBarChartState();
}

class HeartBarChartState extends State<HeartBarChart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: _BarChart()
    );
  }
}
