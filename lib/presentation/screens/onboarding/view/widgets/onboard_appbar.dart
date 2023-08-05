import 'package:flutter/material.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

AppBar buildOnBoardNavBar(BuildContext context, int index) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_left_sharp,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: SizedBox(
      width: double.maxFinite,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: LinearProgressIndicator(
          minHeight: 7,
          backgroundColor: AppColor.babyPurplyBlue,
          color: AppColor.heavyPurplyBlue,
          value: index / 12,
        ),
      ),
    ),
    actions: const [SizedBox(width: 50)],
    centerTitle: true,
  );
}
