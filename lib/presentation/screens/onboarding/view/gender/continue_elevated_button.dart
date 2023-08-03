import 'package:flutter/material.dart';

class ContinueElevatedButton extends StatelessWidget {
  const ContinueElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 250,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Continue"),
      ),
    );
  }
}
