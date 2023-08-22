import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/home/view/heart_widgets/widget/back_ground.dart';
import 'package:heal_her/presentation/screens/home/view/heart_widgets/tabBar.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

import 'heart_widgets/tab_view_heart.dart';
import 'steps_screen/steps_insights.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late TabController _tabController;


  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Day'),
    Tab(text: 'Week'),
    Tab(text: 'Month'),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColor.babyPurplyBlue,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Heart Rate',
          style: TextStyle(color: AppColor.black, fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(children: [
        /*
        This widget is using for representing day,week & month
        tab. The 'backGroundContainer' is common for background of the tabBar.
         */
        backGroundContainer(
            width: screenWidth(double.infinity),
            height: screenHeight(50),
            child: Tabs(tabController: _tabController, myTab: myTabs),
            horizontal: screenWidth(5),
            vertical: screenHeight(5)),
        TabViewBarHeart(
          tabController: _tabController,
        ),
      
      ]),
    );
  }
}
