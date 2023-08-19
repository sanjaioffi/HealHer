import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/onboarding/model/userinfo_model.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth(55), vertical: screenHeight(20)),
      height: screenHeight(55),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(25),
        vertical: screenHeight(2),
      ),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(screenHeight(45))),
      child: TextField(
        onSubmitted: (value) {
          userInfoModel.userName = value;
        },
        style: TextStyle(
          fontSize: screenHeight(17),
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade800,
        ),
        decoration: const InputDecoration(
          hintText: "Enter Your Name",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
