import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinueElevatedButton extends StatelessWidget {
  const ContinueElevatedButton({
    super.key,
    required this.nextRoute,
    this.removeScreen = false,
  });

  final String nextRoute;
  final bool removeScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          removeScreen ? Get.offAllNamed(nextRoute) : Get.toNamed(nextRoute);
        },
        child: const Text(
          "Continue",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
