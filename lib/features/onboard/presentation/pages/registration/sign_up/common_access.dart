import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/app_colors.dart';

import '../../../../../../config/theme/screen_size.dart';

TextField passTextField(
    TextEditingController controller, Function forgetFunction) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
      icon: const Icon(Icons.lock_outline_rounded, color: Colors.black26),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      hintStyle: const TextStyle(color: Colors.black26),
      hintText: 'Password',
      suffix: GestureDetector(
        onTap: () => forgetFunction,
        child: const Text(
          'Forgot?',
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
    ),
  );
}

Center signButton(Function function, String title, BuildContext context) {
  ScreenSize().init(context);
  return Center(
    child: GestureDetector(
      onTap: () => function,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 35.w),
        decoration: BoxDecoration(
            color: AppColor.purplyBlue,
            borderRadius: BorderRadius.circular(15.w)),
        height: 50.w,
        width: 350.w,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    ),
  );
}

TextField emailTextField(TextEditingController controller) {
  return TextField(
    controller: controller,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      icon: const Icon(
        Icons.alternate_email_rounded,
        color: Colors.black26,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      hintStyle: const TextStyle(color: Colors.black26),
      hintText: 'Email ID',
    ),
  );
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: const Divider(
              color: Colors.black,
            ),
          ),
          const Text(
            'OR',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: const Divider(
                color: Colors.black,
                height: 1,
              )),
        ],
      ),
    );
  }
}
