import 'package:flutter/material.dart';
import '../../../../../core/config/theme/app_colors.dart';

class TopTile extends StatelessWidget {
  const TopTile({
    super.key,
    required this.tileContent,
  });

  final String tileContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Text(
        tileContent,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColor.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
