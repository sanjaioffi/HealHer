import 'package:flutter/material.dart';

import '../../../common/screen_utils/screen_size.dart';

import 'common/common_access.dart';

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
              quickSign(
                  appleProcess: () {},
                  context: context,
                  googleProcess: () {},
                  microsoftProcess: () {}),
              SizedBox(
                height: screenHeight(30),
              ),
              orWidget(context),
              SizedBox(
                height: screenHeight(25),
              ),
              emailTextField(controller),
              SizedBox(
                height: screenHeight(18),
              ),
              passTextField(TextEditingController(), () {}),
              signButton(
                      () {

              }, 'Sign up', context),
            ],
          ),
        ),
      ),
    );
  }
}