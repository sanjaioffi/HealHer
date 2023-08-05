import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int dotCount;
  final double dotSize;
  final double spacing;
  final Color activeDotColor;
  final Color inactiveDotColor;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    this.dotCount = 4,
    this.dotSize = 10.0,
    this.spacing = 10.0,
    this.activeDotColor = AppColor.purplyBlue,
    this.inactiveDotColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotCount, (index) {
        bool isActive = index == currentIndex;
        return Container(
          width: dotSize,
          height: dotSize,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? activeDotColor : inactiveDotColor,
          ),
        );
      }),
    );
  }
}
