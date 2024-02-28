import 'package:flutter/material.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/region_tile.dart';

class RegionSlide extends StatelessWidget {
  const RegionSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegionTile(isSouth: true),
              RegionTile(isSouth: false),
            ],
          ),
        ),
      ),
    );
  }
}
