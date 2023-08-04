import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Text(
        tileContent,
        style: const TextStyle(
          color: AppColor.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
