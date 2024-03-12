import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../config/constants/constants.dart';
import '../../../step/presentation/widgets/steps_insights.dart';
import 'back_ground.dart';
import 'bar_widgets.dart';

class TabViewBarHeart extends StatefulWidget {
  TabViewBarHeart({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<TabViewBarHeart> createState() => _TabViewBarHeartState();
}

class _TabViewBarHeartState extends State<TabViewBarHeart> {
  @override
  Widget build(BuildContext context) {
    /*
      NotificationListener is used to remove the scroll glow.

      */
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification notification) {
        notification.disallowIndicator();
        return true;
      },
      /*
      This TabView has Days,Week and Month Data.
       */
      child: Expanded(
        child: TabBarView(controller: widget.tabController, children: [
          DayHeartGraph(),
          WeekHeartGraph(),
          MonthHeartWidget(),
        ]),
      ),
    );
  }
}

class MonthHeartWidget extends StatefulWidget {
  const MonthHeartWidget({
    super.key,
  });

  @override
  State<MonthHeartWidget> createState() => _MonthHeartWidgetState();
}

class _MonthHeartWidgetState extends State<MonthHeartWidget> {
  List<int> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var box = Hive.box(
        'day ${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}');
    setState(() {
      data = box.get('heart',
          defaultValue: List.generate(5, (index) => (random(60, 160))));
      data = data.sublist(0, 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const DateContainer(
          //   periodType: Period.month,
          // ),
          graphBackGroundContainer(
              child: innerGraphWidget(
                  data: data,
                  text1: 'Monthly Data',
                  text2: Text(
                    "Heart Rate",
                    style: textStyle1,
                  ),
                  periodType: Period.month)),
          DoubleMonthData(monthData: monthHeartData, suffix: 'bpm'),
          const DisclaimerText(),
        ],
      ),
    );
  }
}

class WeekHeartGraph extends StatefulWidget {
  const WeekHeartGraph({
    super.key,
  });

  @override
  State<WeekHeartGraph> createState() => _WeekHeartGraphState();
}

class _WeekHeartGraphState extends State<WeekHeartGraph> {
  List<int> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var box = Hive.box(
        'day ${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}');
    setState(() {
      data = box.get('heart',
          defaultValue: List.generate(7, (index) => (random(60, 160))));
      data = data.sublist(0, 7);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const DateContainer(
          //   periodType: Period.week,
          // ),
          graphBackGroundContainer(
              child: innerGraphWidget(
                  data: data,
                  text1: 'Weekly Data',
                  text2: Text(
                    "Heart Rate",
                    style: textStyle1,
                  ),
                  periodType: Period.week)),
          DoubleWeekData(weekData: weekHeartData, suffix: 'bpm'),
          const DisclaimerText()
        ],
      ),
    );
  }
}

class DayHeartGraph extends StatefulWidget {
  const DayHeartGraph({
    super.key,
  });

  @override
  State<DayHeartGraph> createState() => _DayHeartGraphState();
}

class _DayHeartGraphState extends State<DayHeartGraph> {
  List<int> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var box = Hive.box(
        'day ${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}');
    setState(() {
      data = box.get('heart',
          defaultValue: List.generate(20, (index) => (random(60, 160))));
    });
  }

  int averageVal([List<int> heartRates = const []]) {
    if (heartRates.isEmpty) {
      return 0;
    }
    return heartRates.reduce((a, b) => a + b) ~/ heartRates.length;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const DateContainer(
          //   periodType: Period.day,
          // ),

          graphBackGroundContainer(
            child: innerGraphWidget(
              data: data,
              text1: 'Average Heart Rate',
              text2: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: averageVal(data).toString(),
                      style: textStyle1,
                    ),
                    TextSpan(
                      text: ' : bpm',
                      style: textStyle1,
                    )
                  ],
                ),
              ),
              periodType: Period.day,
            ),
          ),
          DayHeartRate(
            heartRates: data,
          ),
          const DisclaimerText()
        ],
      ),
    );
  }
}
