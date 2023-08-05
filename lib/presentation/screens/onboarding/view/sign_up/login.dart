import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/sign_up/quick_sign_up.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';

import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';
import 'common_access.dart';

class OnBoardLogin extends StatefulWidget {
  const OnBoardLogin({super.key});

  @override
  State<OnBoardLogin> createState() => _OnBoardLoginState();
}

class _OnBoardLoginState extends State<OnBoardLogin> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight(20),
              horizontal: screenWidth(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  color: AppColor.babyPurplyBlue,
                ),
                const TopTile(tileContent: "LogIn"),
                SizedBox(
                  height: screenHeight(25),
                ),
                emailTextField(TextEditingController()),
                SizedBox(
                  height: screenHeight(18),
                ),
                passTextField(TextEditingController(), () {}),
                SizedBox(
                  height: screenHeight(40),
                ),
                const ContinueElevatedButton(),
                SizedBox(
                  height: screenHeight(18),
                ),
                const CustomDivider(),
                SizedBox(height: screenHeight(15)),
                const QuickSignUp(),
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
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
