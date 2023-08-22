import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';

class NotificationSlide extends StatelessWidget {
  const NotificationSlide(
      {super.key, required this.tileContent, required this.tileIcon});

  final String tileContent;
  final IconData tileIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                tileIcon,
                size: screenHeight(28),
                color: AppColor.babyPurplyBlue,
              ),
              SizedBox(
                width: screenWidth(20),
              ),
              Text(
                tileContent,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: screenHeight(17),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(25),
            ),
            child: const Divider(
              color: AppColor.bluishCyan,
            ),
          ),
          SizedBox(
            height: screenHeight(15),
          ),
        ],
      ),
    );
  }
}
