import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
    required this.tabController,
    required this.myTab,
  });

  final TabController tabController;
  final List<Tab> myTab;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle:  TextStyle(
          fontSize: screenHeight(15)),

      labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: screenHeight(15)),
      splashBorderRadius: BorderRadius.circular(screenWidth(30)),
      indicator: BoxDecoration(
          color: AppColor.purplyBlue,
          borderRadius: BorderRadius.circular(screenWidth(30))),
      tabs: myTab,
      controller: tabController,
    );
  }
}
