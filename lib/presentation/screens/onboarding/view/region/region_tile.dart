import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../controller/region_controller.dart';

class RegionTile extends StatelessWidget {
  const RegionTile({
    super.key,
    required this.isSouth,
  });

  final bool isSouth;

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
    Get.put(RegionController());
    return GetX<RegionController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.updateGender(isSouth ? 0 : 1);
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
                  colors: isSouth && controller.regionType[0] == 1
                      ? selectedLinearGradient
                      : !isSouth && controller.regionType[1] == 1
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
                    isSouth
                        ? "assets/images/onboard_north.png"
                        : "assets/images/onboard_south.png",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isSouth ? "North" : "South",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSouth && controller.regionType[0] == 1
                          ? Colors.white
                          : !isSouth && controller.regionType[1] == 1
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
