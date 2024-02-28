import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/config/theme/app_colors.dart';

import '../../../controller/food_controller.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.isSouthIndian,
  });

  final bool isSouthIndian;

  static List<Color> unselectedLinearGradient = [
    AppColor.white,
    AppColor.white,
  ];

  static List<Color> selectedLinearGradient = [
    AppColor.heavyPurplyBlue,
    AppColor.heavyPurplyBlue,
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(FoodController());
    return GetX<FoodController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.updateGender(isSouthIndian ? 0 : 1);
          },
          child: Container(
            margin: const EdgeInsets.only(
              left: 15,
              right: 10,
            ),
            height: 250,
            width: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: isSouthIndian && controller.foodType[0] == 1
                      ? selectedLinearGradient
                      : !isSouthIndian && controller.foodType[1] == 1
                          ? selectedLinearGradient
                          : unselectedLinearGradient),
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  25,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 10,
                  spreadRadius: .1,
                  offset: const Offset(1, 5),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Column(
                children: [
                  Image.asset(
                    height: 180,
                    fit: BoxFit.cover,
                    isSouthIndian
                        ? "assets/images/onboard_vegan.png"
                        : "assets/images/onboard_non-vegan.png",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isSouthIndian ? "Vegan" : "Non Vegan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSouthIndian && controller.foodType[0] == 1
                          ? Colors.white
                          : !isSouthIndian && controller.foodType[1] == 1
                              ? Colors.white
                              : AppColor.heavyPurplyBlue,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
