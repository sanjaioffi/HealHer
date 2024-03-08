import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/services/services.dart';
import '../../../config/theme/app_colors.dart';
import 'controller/health_controller.dart';
import 'widgets/health_expansion_tile.dart';

class HealthRecommendationScreen extends StatelessWidget {
  const HealthRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(serviceLocator<HealthController>());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightPurplrBlue,
        title: const Text("Ayurvedic Tips"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GetBuilder<HealthController>(
          builder: (controller) {
            if (controller.healthRecommendaions.isNotEmpty) {
              return ListView.builder(
                itemCount: controller.healthRecommendaions.length,
                itemBuilder: (context, index) {
                  return HealthExpansionTile(
                    healthIssue:
                        controller.healthRecommendaions[index].healthIssue,
                    healthRemedies: controller
                        .healthRecommendaions[index].healthRecommendations,
                  );
                },
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        const CircularProgressIndicator(),
                        Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child: const Text("Fetching Recommendations"),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
        // Column(
        //   children: [

        //     IconButton(
        //       onPressed: () async {
        //         await serviceLocator<HealthController>().getHealth();
        //       },
        //       icon: const Icon(Icons.add),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
