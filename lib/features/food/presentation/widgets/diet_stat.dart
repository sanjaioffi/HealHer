import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/app_colors.dart';
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 4.w),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DietTileData(
                        profileTileTitle: "Carb",
                        profileTileData: "200/ 300",
                        profileTileSuffix: "g",
                      ),
                      DietTileData(
                        profileTileTitle: "Vitamin",
                        profileTileData: "200 / 300",
                        profileTileSuffix: "g",
                      ),
                      DietTileData(
                        profileTileTitle: "Fibre",
                        profileTileData: "200 / 300",
                        profileTileSuffix: "g",
                        isLastTile: true,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        const ListTile(
          title: Text("hjj"),
        ),
      ],
    );
  }
}
