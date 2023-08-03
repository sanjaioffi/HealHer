import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/gender/gender_tile.dart';

class GenderSlide extends StatelessWidget {
  const GenderSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 55,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenderTile(isMale: true),
            GenderTile(isMale: false),
          ],
        ),
      ),
    );
  }
}
