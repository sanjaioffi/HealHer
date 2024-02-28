import 'package:flutter/material.dart';

class ActiveIcons extends StatelessWidget {
  const ActiveIcons({super.key, required this.activityLevel});
  final int activityLevel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: activityLevel == 1
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                            'assets/images/activity_images/flame_active.png'),
                        Image.asset(
                            'assets/images/activity_images/flame_inactive.png'),
                        Image.asset(
                            'assets/images/activity_images/flame_inactive.png')
                      ],
                    )
                  : activityLevel == 2
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                                'assets/images/activity_images/flame_active.png'),
                            Image.asset(
                                'assets/images/activity_images/flame_active.png'),
                            Image.asset(
                                'assets/images/activity_images/flame_inactive.png')
                          ],
                        )
                      : activityLevel == 3
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                    'assets/images/activity_images/flame_active.png'),
                                Image.asset(
                                    'assets/images/activity_images/flame_active.png'),
                                Image.asset(
                                    'assets/images/activity_images/flame_active.png'),
                              ],
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                    'assets/images/activity_images/flame_inactive.png'),
                                Image.asset(
                                    'assets/images/activity_images/flame_inactive.png'),
                                Image.asset(
                                    'assets/images/activity_images/flame_inactive.png')
                              ],
                            ))),
    );
  }
}