import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_stat_tile.dart';

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
            profileTileTitle: "AVG - HR",
            profileTileData: "8",
            profileTileSuffix: "K",
          ),
          HomeTileData(
            profileTileTitle: "AVG - BP",
            profileTileData: "5.2",
            profileTileSuffix: "Km",
          ),
          HomeTileData(
            profileTileTitle: "AVG - SpO2",
            profileTileData: "1.5",
            profileTileSuffix: "Cal",
            isLastTile: true,
          ),
        ],
      ),
    );
  }
}
