import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_data_tile.dart';

class DietBreakDown extends StatelessWidget {
  const DietBreakDown({
    super.key,
  });

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
          )
        ],
      ),
      child: Column(
        children: [
          ExpansionTile(
            leading: Icon(
              Icons.sunny,
              size: 25.sp,
              color: Colors.amber,
            ),
            title: const Text(
              'Morning Breakdown',
            ),
            trailing: CircleAvatar(backgroundColor: Colors.green, radius: 3.r),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
                child: const Row(
                  children: [
                    DietTileData(
                      profileTileTitle: "Carbs",
                      profileTileData: "200/300",
                      profileTileSuffix: "g",
                      isWhiteColor: false,
                    ),
                    DietTileData(
                      profileTileTitle: "Vitamins",
                      profileTileData: "200/300",
                      profileTileSuffix: "g",
                      isWhiteColor: false,
                    ),
                    DietTileData(
                      profileTileTitle: "Fats",
                      profileTileData: "200/300",
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
            child: const Text(
                "It is recommended to use the  debwejwejewbjed ewenwdewk ewk knk"),
          )
        ],
      ),
    );
  }
}
