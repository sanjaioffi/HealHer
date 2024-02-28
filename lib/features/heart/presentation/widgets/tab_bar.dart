import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/theme/app_colors.dart';

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
      unselectedLabelStyle: TextStyle(fontSize: 15.h),
      labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.h),
      splashBorderRadius: BorderRadius.circular(50.w),
      indicator: BoxDecoration(
          color: AppColor.purplyBlue,
          borderRadius: BorderRadius.circular(30.w)),
      tabs: myTab,
      controller: tabController,
    );
  }
}
