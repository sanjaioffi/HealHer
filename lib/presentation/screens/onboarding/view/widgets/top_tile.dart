import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';

import '../../../../utils/app_colors.dart';

class TopTile extends StatelessWidget {
  const TopTile({
    super.key,
    required this.tileContent,
  });

  final String tileContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight(20),
      ),
      child: Text(
        tileContent,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.black,
          fontSize: screenHeight(25),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
