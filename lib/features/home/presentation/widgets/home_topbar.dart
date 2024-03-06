import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cloud_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
        const Text(
          'HealHer',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              letterSpacing: 3,
              fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
    );
  }
}
