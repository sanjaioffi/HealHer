import 'package:flutter/material.dart';
import 'package:heal_her/features/onboard/presentation/widgets/food/food_tile.dart';

class FoodSlide extends StatelessWidget {
  const FoodSlide({
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
              FoodTile(isSouthIndian: true),
              FoodTile(isSouthIndian: false),
            ],
          ),
        ),
      ),
    );
  }
}
