import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../config/theme/app_colors.dart';
import '../../../widgets/generic/continue_elevated_button.dart';
import '../sign_up/common_access.dart';
import '../sign_up/quick_sign_up.dart';
import 'sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              'assets/png/back.png',
            ),

            //
            Text(
              'Login',
              style: TextStyle(fontSize: 25.w, fontWeight: FontWeight.w900),
            ),

            //
            SizedBox(
              height: 25.w,
            ),

            //
            emailTextField(TextEditingController()),

            //
            SizedBox(
              height: 18.w,
            ),
            passTextField(TextEditingController(), () {}),

            //
            SizedBox(height: 20.w),

            //
            const ContinueElevatedButton(
              removeScreen: true,
              nextRoute: '/main',
              canSwitch: true,
              errorMessage: "",
            ),

            //
            SizedBox(height: 20.w), //

            //
            const CustomDivider(),

            //
            SizedBox(height: 35.w),

            //
            const QuickSignUp(),

            ///
            SizedBox(height: 50.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New to HealHer?',
                    style: TextStyle(color: Colors.grey)),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignUp());
                  },
                  child: const Text('Register',
                      style: TextStyle(color: AppColor.purplyBlue)),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
