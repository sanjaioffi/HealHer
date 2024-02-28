import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/screen_size.dart';
import 'package:heal_her/features/heart/presentation/widgets/back_ground.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'bar_widgets.dart';

class HeartBarChart extends StatefulWidget {
  const HeartBarChart({super.key, required this.periodType});

  final Period periodType;

  @override
  _HeartBarChartState createState() => _HeartBarChartState();
}

class _HeartBarChartState extends State<HeartBarChart> {
  List<int> data = List.generate(100, (index) => random(60, 160));
  List<int> monthData = List.generate(5, (index) => random(60, 160));

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more data when reaching the end
      _loadMoreData();
    }
  }

  void _loadMoreData() async {
    setState(() {
      // Append new data to the existing list
      data.addAll(List.generate(50, (index) => (random(60, 160))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: SizedBox(
        width: data.length *
            (widget.periodType == Period.month
                ? 60.w
                : (widget.periodType == Period.week ? 45.w : 50.w)),
        height: 300,
        child: BarChart(
          BarChartData(
            barTouchData: barTouchData,
            titlesData: titlesData,
            borderData: borderData,
            gridData: const FlGridData(
              show: false,
            ),
            alignment: BarChartAlignment.spaceAround,
            maxY: 200,
            barGroups: data
                .asMap()
                .map((index, value) => MapEntry(
                      index,
                      BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            width: barWidth,
                            toY: value.toDouble(),
                            gradient: barsGradient,
                          )
                        ],
                        showingTooltipIndicators: [0],
                      ),
                    ))
                .values
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.bold,
      fontSize: 13.h,
    );
    String text;

    if (widget.periodType == Period.day) {
      text = value.toInt().toString();
    } else if (widget.periodType == Period.week) {
      switch (value.toInt()) {
        case 0:
          text = 'Mn';
          break;
        case 1:
          text = 'Te';
          break;
        case 2:
          text = 'Wd';
          break;
        case 3:
          text = 'Tu';
          break;
        case 4:
          text = 'Fr';
          break;
        case 5:
          text = 'St';
          break;
        case 6:
          text = 'Sn';
          break;
        default:
          text = '';
          break;
      }
    } else {
      switch (value.toInt()) {
        case 0:
          text = 'Week1';
          break;
        case 1:
          text = 'Week2';
          break;
        case 2:
          text = 'Week3';
          break;
        case 3:
          text = 'Week4';
          break;
        case 4:
          text = 'Week5';
          break;

        default:
          text = '';
          break;
      }
    }

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
}