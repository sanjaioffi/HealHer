import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/features/device/controller/data_controller.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (isPressed) {
                isPressed = false;
              } else {
                isPressed = true;
              }
            });

            isPressed
                ? {Get.find<DataController>().sendCommand('hrps')}
                : Get.find<DataController>().sendCommand('stop', data: 'hrps');
            isPressed
                ? Get.snackbar('Measuring', 'Requesting Data...')
                : Get.snackbar('Stopped', 'Requesting Data Stopped');
            
          },
          icon: isPressed
              ? const Icon(
                  Icons.cloud_outlined,
                  color: Colors.white,
                  size: 30,
                )
              : const Icon(
                  Icons.cloud_off_outlined,
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
