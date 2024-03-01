import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContinueElevatedButton extends StatefulWidget {
  const ContinueElevatedButton({
    super.key,
    required this.nextRoute,
    required this.canSwitch,
    required this.errorMessage,
    this.removeScreen = false,
    this.buttonText = "Continue",
  });

  final String nextRoute;
  final bool removeScreen;
  final bool canSwitch;
  final String errorMessage;
  final String buttonText;

  @override
  State<ContinueElevatedButton> createState() => _ContinueElevatedButtonState();
}

class _ContinueElevatedButtonState extends State<ContinueElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          if (widget.canSwitch) {
            widget.removeScreen
                ? Get.offAllNamed(widget.nextRoute)
                : Get.toNamed(widget.nextRoute);
          } else {
            Get.snackbar(
              padding: EdgeInsets.all(10.w),
              'Error',
              widget.errorMessage,
              snackPosition: SnackPosition.TOP,
            );
          }
        },
        child: Text(
          widget.buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
