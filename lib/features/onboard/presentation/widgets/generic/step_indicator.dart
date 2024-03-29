import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    super.key,
    required this.step,
  });

  final int step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "STEP $step / 7",
        style: const TextStyle(
          color: AppColor.purplyBlue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
