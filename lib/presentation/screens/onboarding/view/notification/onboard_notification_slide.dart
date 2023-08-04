import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class NotificationSlide extends StatelessWidget {
  const NotificationSlide(
      {super.key, required this.tileContent, required this.tileIcon});

  final String tileContent;
  final IconData tileIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                tileIcon,
                size: 28,
                color: AppColor.babyPurplyBlue,
              ),
              const SizedBox(width: 20),
              Text(
                tileContent,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Divider(
              color: AppColor.bluishCyan,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
