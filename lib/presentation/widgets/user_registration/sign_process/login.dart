import 'package:flutter/material.dart';

import '../../../common/screen_utils/screen_size.dart';
import '../../../themes/app_colors.dart';
import 'common/common_access.dart';

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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            passTextField(TextEditingController(),(){}),
            signButton((){},'Login',context),
            orWidget(context),
            SizedBox(height: screenHeight(35)),
            quickSign(
                appleProcess: () {},
                context: context,
                googleProcess: () {},
                microsoftProcess: () {}),
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
                  onTap: () {},
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
