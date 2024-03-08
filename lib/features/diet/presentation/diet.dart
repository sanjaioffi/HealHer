import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/services/services.dart';
import 'controller/diet_controller.dart';
import 'widgets/diet_details.dart';
import 'widgets/diet_stat.dart';

class FoodRecommendationScreen extends StatelessWidget {
  const FoodRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(serviceLocator<DietController>());

    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DietOverView(),
            DietBreakDown(),
          ],
        ),
      ),
    );
  }
}
