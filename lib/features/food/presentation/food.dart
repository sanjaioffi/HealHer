import 'package:flutter/material.dart';
import 'widgets/diet_details.dart';
import 'widgets/diet_stat.dart';

class FoodRecommendationScreen extends StatelessWidget {
  const FoodRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
