import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/constants/constants.dart';
import '../controller/diet_controller.dart';
import 'diet_break_down_widget.dart';

class DietBreakDown extends StatelessWidget {
  const DietBreakDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DietController>(builder: (controller) {
      return controller.dietList.isEmpty
          ? Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  children: [
                    const CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: const Text("Loading Diet Plans"),
                    )
                  ],
                ),
              ),
            )
          : Column(
              children: [
                for (int i = 0; i < controller.dietList.length; i++)
                  DietBreakDownWidget(
                    sessionName: controller.dietList[i].sessionName,
                    sessionMsg: controller.dietList[i].sessionMsg,
                    sessionCarbs: controller.dietList[i].sessionCarbs,
                    sessionVitamins: controller.dietList[i].sessionProtein,
                    sessionCalories: controller.dietList[i].sessionCalories,
                    sessionFats: controller.dietList[i].sessionFat,
                    sessionTileIcon: tileIconData[i],
                    sessionTileColor: tileColorData[i],
                  ),
              ],
            );
    });
  }
}
