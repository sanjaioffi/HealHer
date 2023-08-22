import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/onboarding/view/notification/onboard_notification_slide.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight(25),
        bottom: screenHeight(10),
      ),
      child: const Column(
        children: [
          NotificationSlide(
            tileContent: "Ai powered Health Recommendations",
            tileIcon: Icons.auto_awesome,
          ),
          NotificationSlide(
            tileContent: "Food Diet Health Recommendation  ",
            tileIcon: Icons.whatshot,
          ),
          NotificationSlide(
            tileContent: "Water Ramainders & Much More....",
            tileIcon: Icons.favorite_outlined,
          ),
        ],
      ),
    );
  }
}
