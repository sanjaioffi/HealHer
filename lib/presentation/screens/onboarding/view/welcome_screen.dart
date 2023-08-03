import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60),
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
              SizedBox(
                width: 300,
                child: Text(
                  ' Empowering Women\'s Safety & overall Wellness with HealHer SmartBand.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Image.asset('assets/images/welcome.png'),
              ElevatedButton(
                  onPressed: () {}, child: Center(child: Text('Get Started'))),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: AppColor.black,
                      fontFamily: 'Poppins',
                    )),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Sign In');
                      },
                    text: ' SignIn',
                    style: TextStyle(
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
