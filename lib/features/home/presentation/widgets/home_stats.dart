import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/home/presentation/widgets/home_stat_tile.dart';

class HomeHealthStat extends StatelessWidget {
  const HomeHealthStat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 15.w,
        right: 15.w,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeTileData(
            profileTileTitle: "Steps",
            profileTileData: "8",
            profileTileSuffix: "K",
          ),
          HomeTileData(
            profileTileTitle: "Distance",
            profileTileData: "5.2",
            profileTileSuffix: "Km",
          ),
          HomeTileData(
            profileTileTitle: "Calories",
            profileTileData: "1.5",
            profileTileSuffix: "Cal",
            isLastTile: true,
          ),
        ],
      ),
    );
  }
}
