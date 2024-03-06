import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../config/theme/app_colors.dart';
import '../../pages/registration/sign_process/login.dart';

class SignInText extends StatelessWidget {
  const SignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28.h),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                color: AppColor.black,
                fontFamily: 'Poppins',
              ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(() => const Login());
                },
              text: ' SignIn',
              style: const TextStyle(
                color: AppColor.heavyPurplyBlue,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
