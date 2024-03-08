import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/scan_controller.dart';

class AvailableDevicesScreen extends StatelessWidget {
  const AvailableDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Available Devices'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Get.find<ScanController>().onRefresh();
            },
          ),
        ],
      ),
      body: Obx(() {
        final controller = Get.find<ScanController>();
        return ListView.builder(
          itemCount: controller.scanResults.length,
          itemBuilder: (context, index) {
            final device = controller.scanResults[index].device;
            return device.advName == '' ||
                    device == controller.selectedDevice.value
                ? const SizedBox()
                : ListTile(
                    title: Text(device.advName),
                    subtitle: Text(device.remoteId.toString()),
                    trailing: TextButton(
                      child: const Text('Connect'),
                      onPressed: () {
                        controller.onConnectPressed(device);
                      },
                    ),
                  );
          },
        );
      }),
    );
  }
}
