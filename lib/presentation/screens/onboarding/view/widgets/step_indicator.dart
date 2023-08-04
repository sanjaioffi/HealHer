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
    return Text(
      "STEP $step / 7",
      style: const TextStyle(
        color: AppColor.purplyBlue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
