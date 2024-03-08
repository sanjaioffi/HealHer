import 'package:flutter/material.dart';

import '../../../config/routes/route_names.dart';
import 'widgets/generic/bottom_tile.dart';
import 'widgets/generic/continue_elevated_button.dart';
import 'widgets/welcome/welcome_msg.dart';
import 'widgets/welcome/welcome_sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //
              const WelcomeMessage(),

              //
              const BottomTile(
                  tileContent:
                      ' Empowering Women\'s Safety & overall Wellness with HealHer SmartBand.'),

              //
              Image.asset('assets/images/welcome.png'),

              //
              ContinueElevatedButton(
                nextRoute: AppRoute.onboardName,
                canSwitch: true,
                errorMessage: "",
              ),

              //

              const SignInText()
            ],
          ),
        ),
      ),
    );
  }
}
