import 'package:flutter/material.dart';

class ContinueElevatedButton extends StatelessWidget {
  const ContinueElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: ElevatedButton(
        onPressed: () {},
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
