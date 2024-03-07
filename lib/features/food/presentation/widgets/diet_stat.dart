import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'package:heal_her/features/food/presentation/controller/diet_controller.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_calorie_info.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_data_tile.dart';

class DietOverView extends StatelessWidget {
  const DietOverView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.56,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColor.heavyPurplyBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
            ),
            Column(
              children: [
                const CalorieInfo(),
                GetBuilder<DietController>(builder: (controller) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: .5.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DietTileData(
                          profileTileTitle: "Carbs",
                          profileTileData:
                              "${controller.carbsRequired.value.toInt()}/ ${controller.caloriesRequired.value.toInt()}",
                          profileTileSuffix: "g",
                        ),
                        DietTileData(
                          profileTileTitle: "Vitamin",
                          profileTileData:
                              "${controller.proteinRequired.value.toInt()} / ${controller.caloriesRequired.value.toInt()}",
                          profileTileSuffix: "g",
                        ),
                        DietTileData(
                          profileTileTitle: "Fat",
                          profileTileData:
                              "${controller.fatRequired.value.toInt()} / ${controller.caloriesRequired.value.toInt()}",
                          profileTileSuffix: "g",
                          isLastTile: true,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            )
          ],
        ),
      ],
    );
  }
}
