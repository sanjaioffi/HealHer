import 'package:flutter/material.dart';

class BlueTestApp extends StatefulWidget {
  const BlueTestApp({super.key});

  @override
  State<BlueTestApp> createState() => _BlueTestAppState();
}

class _BlueTestAppState extends State<BlueTestApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth'),
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){}, child: Text('Get Devices')),
          const Center(
            child: Text('Bluetooth Test App'),
          ),
        ],
      ),
    );
  }
}