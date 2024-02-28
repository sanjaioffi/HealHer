import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'quick_sign_up.dart';
import '../../../widgets/generic/continue_elevated_button.dart';
import '../../../widgets/generic/top_tile.dart';

import '../../../../../../config/theme/screen_size.dart';
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
                  height: 300.h,
                  color: Colors.red,
                ),
                const TopTile(tileContent: "SignUp"),
                SizedBox(
                  height: 20.h,
                ),
                const QuickSignUp(),
                SizedBox(
                  height: 30.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 25.h,
                ),
                emailTextField(_controller),
                SizedBox(
                  height: 18.h,
                ),
                passTextField(
                  TextEditingController(),
                  () {},
                ),
                const ContinueElevatedButton(
                  nextRoute: '/name',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
