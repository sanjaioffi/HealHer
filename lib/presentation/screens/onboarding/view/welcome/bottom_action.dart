import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/onboarding/view/sign_process/login.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class BottomAction extends StatelessWidget {
  const BottomAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight(35),
        bottom: screenHeight(25),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(() => const Login());
                },
              text: ' SignIn',
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: AppColor.heavyPurplyBlue,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
