import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/notification/onboard_notification_content.dart';
import 'package:heal_her/presentation/screens/onboarding/view/notification/onboard_notification_header.dart';

import 'onboard_notification_gif.dart';

class OnBoardNotificationScreen extends StatelessWidget {
  const OnBoardNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 12),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepIndicator(step: 12),
              NotificationHeader(),
              NotificationGIF(),
              NotificationContent(),
              SizedBox(height: 20),
              ContinueElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
