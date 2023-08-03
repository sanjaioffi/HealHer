import 'package:flutter/material.dart';

AppBar buildOnBoardNavBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_left_sharp,
        color: Colors.black,
      ),
      onPressed: () {},
    ),
  );
}
