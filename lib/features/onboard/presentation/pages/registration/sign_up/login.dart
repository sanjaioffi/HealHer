import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/presentation/pages/registration/sign_up/quick_sign_up.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/top_tile.dart';
import 'package:heal_her/config/theme/app_colors.dart';

import '../../../../../../config/theme/screen_size.dart';
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
              vertical: 20.h,
              horizontal: 10.w,
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
                  height: 25.h,
                ),
                emailTextField(TextEditingController()),
                SizedBox(
                  height: 18.h,
                ),
                passTextField(TextEditingController(), () {}),
                SizedBox(
                  height: 40.h,
                ),
                const ContinueElevatedButton(
                  nextRoute: '/main',
                ),
                SizedBox(
                  height: 18.h,
                ),
                const CustomDivider(),
                SizedBox(height: 15.h),
                const QuickSignUp(),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New to HealHer?',
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      width: 10.w,
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
