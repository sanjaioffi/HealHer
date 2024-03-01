import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/tab_view_heart.dart';
import 'widgets/back_ground.dart';
import 'widgets/tab_bar.dart';
import '../../../config/theme/app_colors.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: '   Day   ',
      iconMargin: EdgeInsets.all(10),
    ),
    Tab(text: ' Week '),
    Tab(text: ' Month '),
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
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
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
        backGroundContainer(
          width: double.maxFinite,
          height: 50.h,
          child: Tabs(tabController: _tabController, myTab: myTabs),
          horizontal: 5.w,
          vertical: 5.h,
        ),
        TabViewBarHeart(
          tabController: _tabController,
        ),
      ]),
    );
  }
}
