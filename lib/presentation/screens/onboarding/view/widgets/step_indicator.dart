import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

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
        "STEP $step / 12",
        style: const TextStyle(
          color: AppColor.purplyBlue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
