import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/sign_up/common_access.dart';
import 'package:heal_her/presentation/screens/onboarding/view/sign_up/quick_sign_up.dart';
import 'package:heal_her/presentation/screens/onboarding/view/user_name/user_name.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';

import '../../../../common/screen_utils/screen_size.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/png/welcome.png',
              ),
              Text(
                'Sign up',
                style: TextStyle(
                    fontSize: screenHeight(25), fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: screenHeight(35),
              ),
              QuickSignUp(),
              SizedBox(
                height: screenHeight(30),
              ),
             CustomDivider(),
              SizedBox(
                height: screenHeight(25),
              ),
              emailTextField(controller),
              SizedBox(
                height: screenHeight(18),
              ),
              passTextField(TextEditingController(), () {}),
              SizedBox(height: screenHeight(20)),
              ContinueElevatedButton(nextRoute: 'name',)
            ],
          ),
        ),
      ),
    );
  }
}
