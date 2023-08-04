import 'package:flutter/material.dart';

class NotificationGIF extends StatelessWidget {
  const NotificationGIF({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Image.asset(
        "assets/gif/sample.gif",
      ),
    );
  }
}
