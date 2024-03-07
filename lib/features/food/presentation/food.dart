import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/features/food/presentation/controller/diet_controller.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_details.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_list_view.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_stat.dart';

class FoodRecommendationScreen extends StatelessWidget {
  const FoodRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(serviceLocator<DietController>());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DietOverView(),
            const DietBreakDown(),
            const DietListView(),
            IconButton(
              onPressed: () {
                serviceLocator<DietController>().determineDietList();
              },
              icon: const Icon(
                Icons.alarm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
