import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/notification/onboard_notification_slide.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 25, bottom: 10),
      child: Column(
        children: [
          NotificationSlide(
            tileContent: "AI powered Live Recommendations",
            tileIcon: Icons.auto_awesome,
          ),
          NotificationSlide(
            tileContent: "Food Diet Health Recommendation",
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
