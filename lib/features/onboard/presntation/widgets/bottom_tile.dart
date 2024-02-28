import 'package:flutter/material.dart';
import 'package:heal_her/config/theme/app_colors.dart';

class BottomTile extends StatelessWidget {
  const BottomTile({
    super.key,
    required this.tileContent,
  });

  final String tileContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Text(
        tileContent,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColor.santaGrey,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
