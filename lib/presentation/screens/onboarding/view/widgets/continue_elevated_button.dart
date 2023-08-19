import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';

class ContinueElevatedButton extends StatelessWidget {
  const ContinueElevatedButton({
    super.key,
    required this.nextRoute,
  });

  final String nextRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(8.0),
      ),
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
