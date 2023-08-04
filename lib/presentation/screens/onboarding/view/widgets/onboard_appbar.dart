import 'package:flutter/material.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

AppBar buildOnBoardNavBar(BuildContext context) {
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
    title: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
        Radius.circular(20),
      )),
      width: 100,
      child: const LinearProgressIndicator(
        minHeight: 4,
        backgroundColor: AppColor.babyPurplyBlue,
        color: AppColor.heavyPurplyBlue,
        value: .1,
      ),
    ),
    centerTitle: true,
  );
}
