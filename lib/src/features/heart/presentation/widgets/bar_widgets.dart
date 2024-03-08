import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';

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

double get barWidth => 10.w;

FlBorderData get borderData => FlBorderData(
      show: false,
    );

LinearGradient get barsGradient => LinearGradient(
      colors: [
        AppColor.purplyBlue.withAlpha(20),
        AppColor.heavyPurplyBlue.withGreen(4),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

List<BarChartGroupData> get barGroups => List.generate(10, (index) {
      return BarChartGroupData(
        // barsSpace: 50,
        x: index,
        barRods: [
          BarChartRodData(
            width: barWidth,
            toY: random(60, 160).toDouble(),
            gradient: barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      );
    });

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}
