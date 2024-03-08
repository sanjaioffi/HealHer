import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';

class BlueScreen extends StatefulWidget {
  const BlueScreen({super.key});

  @override
  State<BlueScreen> createState() => _BlueScreenState();
}

class _BlueScreenState extends State<BlueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.heavyPurplyBlue,
        centerTitle: true,
        title: Text('Bluetooth', style: TextStyle(color: AppColor.white)),
      ),
    );
  }
}
