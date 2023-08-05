import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/sign_up/quick_sign_up.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

import '../../../../common/screen_utils/screen_size.dart';
import 'common_access.dart';

class OnBoardSignUpScreen extends StatefulWidget {
  const OnBoardSignUpScreen({super.key});

  @override
  State<OnBoardSignUpScreen> createState() => _OnBoardSignUpScreenState();
}

class _OnBoardSignUpScreenState extends State<OnBoardSignUpScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight(300),
                  color: Colors.red,
                ),
                const TopTile(tileContent: "SignUp"),
                SizedBox(
                  height: screenHeight(20),
                ),
                const QuickSignUp(),
                SizedBox(
                  height: screenHeight(30),
                ),
                const CustomDivider(),
                SizedBox(
                  height: screenHeight(25),
                ),
                emailTextField(_controller),
                SizedBox(
                  height: screenHeight(18),
                ),
                passTextField(
                  TextEditingController(),
                  () {},
                ),
                const ContinueElevatedButton(nextRoute: '/name',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
