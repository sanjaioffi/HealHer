import 'package:flutter/material.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_details.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_list_view.dart';
import 'package:heal_her/features/food/presentation/widgets/diet_stat.dart';

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
            DietListView(),
            SizedBox(
              height: 900,
            ),
            Text("Hi"),
          ],
        ),
      ),
    );
  }
}
