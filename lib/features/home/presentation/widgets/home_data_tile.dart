import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/theme/app_colors.dart';

class HomeDataTile extends StatelessWidget {
  const HomeDataTile({
    super.key,
    required this.isEnabled,
    required this.backgroundColor,
    required this.nextScreen,
    required this.title,
    required this.body,
  });

  final Color backgroundColor;
  final String title;
  final Widget body;
  final Widget nextScreen;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isEnabled ? Get.to(() => nextScreen) : null;
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
                title == 'Heart Rate'
                    ? const Icon(
                        Icons.favorite,
                        color: AppColor.babyPurplyBlue,
                      )
                    : title == 'Blood Pressure'
                        ? const Icon(
                            Icons.timelapse,
                            color: AppColor.babyPurplyBlue,
                          )
                        : title == 'Spo2'
                            ? const Icon(
                                Icons.water_damage,
                                color: AppColor.babyPurplyBlue,
                              )
                            : const Icon(
                                Icons.healing,
                                color: AppColor.babyPurplyBlue,
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
