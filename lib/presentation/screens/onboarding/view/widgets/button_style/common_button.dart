import 'package:flutter/material.dart';

import '../../../../../common/screen_utils/screen_size.dart';
import '../../../../../utils/app_colors.dart';


Widget commonButton(
    {required function, required String text, required BuildContext context}) {
  return FilledButton(
    onPressed: () {
      function();
    },
    style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(AppColor.purplyBlue),
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: screenWidth(60))),
        shape: MaterialStatePropertyAll(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        textStyle: MaterialStatePropertyAll(TextStyle(
            fontSize: screenHeight(18), fontWeight: FontWeight.w700))),
    child: Text(text),
  );
}
