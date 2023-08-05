import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/screens/onboarding/view/notification/onboard_notification.dart';
import 'package:heal_her/presentation/screens/onboarding/view/sign_process/sign_up.dart';
import 'package:heal_her/presentation/screens/onboarding/view/sign_up/quick_sign_up.dart';
import 'package:heal_her/presentation/screens/onboarding/view/user_name/user_name.dart';
import 'package:heal_her/presentation/screens/onboarding/view/welcome/welcome_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';

import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';
import '../sign_up/common_access.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              'assets/png/back.png',
            ),
            Text(
              'Login',
              style: TextStyle(
                  fontSize: screenHeight(25), fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: screenHeight(25),
            ),
            emailTextField(TextEditingController()),
            SizedBox(
              height: screenHeight(18),
            ),
            passTextField(TextEditingController(), () {}),
            SizedBox(height: screenHeight(20)),
            ContinueElevatedButton(
              nextRoute: '/notification',
            ),
            SizedBox(height: screenHeight(20)),
            CustomDivider(),
            SizedBox(height: screenHeight(35)),
            QuickSignUp(),
            SizedBox(height: screenHeight(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New to HealHer?',
                    style: TextStyle(color: Colors.grey)),
                SizedBox(
                  width: screenWidth(10),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignUp());
                  },
                  child: const Text('Register',
                      style: TextStyle(color: AppColor.purplyBlue)),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
