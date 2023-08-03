import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/screens/onboarding/controller/gender_controller.dart';

class GenderTile extends StatelessWidget {
  const GenderTile({
    super.key,
    required this.isMale,
  });

  final bool isMale;

  @override
  Widget build(BuildContext context) {
    Get.put(GenderController());
    return GetX<GenderController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.updateGender(isMale ? 0 : 1);
          },
          child: Container(
            margin: const EdgeInsets.only(
              left: 15,
              right: 10,
            ),
            height: 230,
            width: 170,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  25,
                ),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  controller.gender[0] == controller.gender[1]
                      ? "assets/images/pattern.png"
                      : isMale && controller.gender[0] == 1
                          ? "assets/images/tile_patterns.png"
                          : !isMale && controller.gender[1] == 1
                              ? "assets/images/tile_patterns.png"
                              : "assets/images/pattern.png",
                ),
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  isAntiAlias: true,
                  isMale
                      ? "assets/images/onboard_male.png"
                      : "assets/images/onboard_female.png",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
