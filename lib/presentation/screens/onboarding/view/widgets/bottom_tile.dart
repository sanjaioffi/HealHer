import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';

import '../../../../utils/app_colors.dart';

class BottomTile extends StatelessWidget {
  const BottomTile({
    super.key,
    required this.tileContent,
  });

  final String tileContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth(20),
        right: screenWidth(20),
        bottom: screenHeight(20),
      ),
      child: Text(
        tileContent,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.santaGrey,
          fontSize: screenHeight(15),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
