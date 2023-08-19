import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/model/welcome_model.dart';
import 'package:heal_her/presentation/screens/onboarding/view/welcome/bottom_action.dart';
import 'package:heal_her/presentation/screens/onboarding/view/welcome/top_greetings.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const TopGrettings(),
              BottomTile(tileContent: welcomeMessageModel.bottomTileContent),
              Image.asset('assets/images/welcome.png'),
              ContinueElevatedButton(nextRoute: welcomeMessageModel.nextRoute),
              const BottomAction()
            ],
          ),
        ),
      ),
    );
  }
}
