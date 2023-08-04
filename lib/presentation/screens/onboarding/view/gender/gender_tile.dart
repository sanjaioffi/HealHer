import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/screens/onboarding/controller/gender_controller.dart';

import '../../../../utils/app_colors.dart';

class GenderTile extends StatelessWidget {
  const GenderTile({
    super.key,
    required this.isMale,
  });

  final bool isMale;

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
            height: 250,
            width: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: isMale && controller.gender[0] == 1
                      ? selectedLinearGradient
                      : !isMale && controller.gender[1] == 1
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
                    isMale
                        ? "assets/images/onboard_female.png"
                        : "assets/images/onboard_male.png",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isMale ? "Female" : "Male",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMale && controller.gender[0] == 1
                          ? Colors.white
                          : !isMale && controller.gender[1] == 1
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
