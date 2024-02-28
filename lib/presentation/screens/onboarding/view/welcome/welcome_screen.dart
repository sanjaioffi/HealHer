import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heal_her/presentation/screens/onboarding/view/sign_process/login.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                          text: 'Welcome to ',
                          style: TextStyle(
                            letterSpacing: 1,
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                          )),
                      TextSpan(
                          text: 'HealHer',
                          style: TextStyle(
                            letterSpacing: 1,
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColor.heavyPurplyBlue,
                          )),
                      TextSpan(
                          text: ' SmartApp',
                          style: TextStyle(
                            letterSpacing: 1,
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                          )),
                    ])),
              ),
              const BottomTile(
                  tileContent:
                      ' Empowering Women\'s Safety & overall Wellness with HealHer SmartBand.'),
              Image.asset('assets/images/welcome.png'),
              const ContinueElevatedButton(
                nextRoute: '/signup',
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: AppColor.black,
                      fontFamily: 'Poppins',
                    )),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const Login());
                      },
                    text: ' SignIn',
                    style: const TextStyle(
                        color: AppColor.heavyPurplyBlue,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
