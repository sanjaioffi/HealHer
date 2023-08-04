import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Text(
        "Do you want to turn on notification?",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
