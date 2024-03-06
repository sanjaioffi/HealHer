import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'gender_tile.dart';

class GenderSlide extends StatelessWidget {
  const GenderSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 45.h),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenderTile(isMale: false),
            GenderTile(isMale: true),
          ],
        ),
      ),
    );
  }
}
