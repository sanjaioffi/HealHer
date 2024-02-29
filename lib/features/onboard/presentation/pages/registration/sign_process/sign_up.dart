import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../sign_up/common_access.dart';
import '../sign_up/quick_sign_up.dart';
import '../../../widgets/generic/continue_elevated_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/png/welcome.png',
              ),
              Text(
                'Sign up',
                style: TextStyle(fontSize: 25.w, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 35.w,
              ),
              const QuickSignUp(),
              SizedBox(
                height: 30.w,
              ),
              const CustomDivider(),
              SizedBox(
                height: 25.w,
              ),
              emailTextField(controller),
              SizedBox(
                height: 18.w,
              ),
              passTextField(TextEditingController(), () {}),
              SizedBox(height: 20.w),
              const ContinueElevatedButton(
                errorMessage: "",
                nextRoute: 'name',
                canSwitch: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
