import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/app_colors.dart';

class HomeDataTile extends StatelessWidget {
  const HomeDataTile({
    super.key,
    required this.backgroundColor,
    required this.nextScreen,
    required this.title,
    required this.body,
  });

  final Color backgroundColor;
  final String title;
  final Widget body;
  final Widget nextScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => nextScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                const Icon(
                  Icons.directions_walk_rounded,
                  color: AppColor.stepsIndicator,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(height: 20),
            body,
          ],
        ),
      ),
    );
  }
}
