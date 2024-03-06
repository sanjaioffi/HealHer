import 'package:flutter/material.dart';
import 'package:heal_her/config/theme/app_colors.dart';

class FoodRecommendationPage extends StatelessWidget {
  const FoodRecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.heavyPurplyBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Food App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Find the food of your special taste',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/food_image.png'),
            ),
            SizedBox(height: 20),
            SizedBox(height: 10),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BENEFITS',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '1 / 3',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Find the perfect place',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'We can help you to find the place to eat - perfectly fit or your preferences.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
