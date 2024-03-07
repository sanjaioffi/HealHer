import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_data_tile.dart';

class DietBreakDownWidget extends StatelessWidget {
  const DietBreakDownWidget({
    super.key,
    required this.sessionName,
    required this.sessionMsg,
    required this.sessionCarbs,
    required this.sessionVitamins,
    required this.sessionFats,
    required this.sessionCalories,
    required this.sessionTileIcon,
    required this.sessionTileColor,
  });

  final String sessionName;
  final String sessionMsg;

  final double sessionCarbs;
  final double sessionVitamins;
  final double sessionFats;
  final double sessionCalories;

  //

  final IconData sessionTileIcon;
  final Color sessionTileColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: double.maxFinite.w,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: .11,
          )
        ],
      ),
      child: Column(
        children: [
          ExpansionTile(
            leading: Icon(
              sessionTileIcon,
              size: 25.sp,
              color: sessionTileColor,
            ),
            title: Text(
              '$sessionName Breakdown',
            ),
            trailing: CircleAvatar(backgroundColor: Colors.green, radius: 3.r),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
                child: Row(
                  children: [
                    DietTileData(
                      profileTileTitle: "Carbs",
                      profileTileData:
                          "${sessionCarbs.toInt()}/${sessionCalories.toInt()}",
                      profileTileSuffix: "g",
                      isWhiteColor: false,
                    ),
                    DietTileData(
                      profileTileTitle: "Vitamins",
                      profileTileData:
                          "${sessionVitamins.toInt()}/${sessionCalories.toInt()}",
                      profileTileSuffix: "g",
                      isWhiteColor: false,
                    ),
                    DietTileData(
                      profileTileTitle: "Fats",
                      profileTileData:
                          "${sessionFats.toInt()}/${sessionCalories.toInt()}",
                      profileTileSuffix: "g",
                      isWhiteColor: false,
                      isLastTile: true,
                    ),
                  ],
                ),
              ),
            ],
          ),

          //
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: Text(
              sessionMsg,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
