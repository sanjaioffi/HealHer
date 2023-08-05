import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinueElevatedButton extends StatelessWidget {
  const ContinueElevatedButton({
    super.key,
    required this.nextRoute,
  });

  final String nextRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(nextRoute);
        },
        child: const Text(
          "Continue",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
