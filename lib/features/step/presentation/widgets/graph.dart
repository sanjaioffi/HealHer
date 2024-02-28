import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ScrollableBarChart extends StatefulWidget {
  @override
  _ScrollableBarChartState createState() => _ScrollableBarChartState();
}

class _ScrollableBarChartState extends State<ScrollableBarChart> {
  List<double> data = List.generate(100, (index) => index * 10.0);

  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more data when reaching the end
      if (!_isLoading) {
        _loadMoreData();
      }
    }
  }

  void _loadMoreData() async {
    setState(() {
      _isLoading = true;
    });

    // // Simulate loading more data
    // await Future.delayed(Duration(seconds: 2));

    setState(() {
      // Append new data to the existing list
      data.addAll(List.generate(50, (index) => (data.length + index) * 10.0));
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable Bar Chart'),
      ),
      body: Container(
        height: 500,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Container(
                  width: data.length * 50.0,
                  height: 300,
                  child: BarChart(
                    BarChartData(
                      barGroups: data
                          .asMap()
                          .map((index, value) => MapEntry(
                                index,
                                BarChartGroupData(
                                  x: index,
                                  barRods: [
                                    BarChartRodData(
                                      toY: value,
                                    ),
                                  ],
                                ),
                              ))
                          .values
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
            _isLoading ? CircularProgressIndicator() : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
