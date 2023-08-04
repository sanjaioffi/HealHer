import 'package:flutter/material.dart';

import '../../../../common/screen_utils/screen_size.dart';
import '../../../../themes/app_colors.dart';
Row orWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
          child: Divider(color: Colors.grey.shade200)),
      Text(
        'OR',
        style: TextStyle(color: Colors.grey.shade500),
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
          child: Divider(color: Colors.grey.shade200, height: 1)),
    ],
  );
}
TextField passTextField(TextEditingController controller,Function forgetFunction) {
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
            onTap:()=>forgetFunction,
            child: const Text(
              'Forgot?',
              style: TextStyle(color: Colors.blueAccent),
            ))),
  );
}

Center signButton(Function function,String title,BuildContext context) {  ScreenSize().init(context);
  return Center(
    child: GestureDetector(
      onTap: () =>function,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: screenHeight(35)),
        decoration: BoxDecoration(
            color: AppColor.purplyBlue,
            borderRadius: BorderRadius.circular(screenWidth(15))),
        height: screenHeight(50),
        width: screenWidth(350),
        child:  Center(
          child: Text(
            title,
            style:const TextStyle(
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
    onChanged: (value){
      controller.text=value;
    },
    decoration: InputDecoration(
        icon:
        const Icon(Icons.alternate_email_rounded, color: Colors.black26),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        hintStyle: const TextStyle(color: Colors.black26),
        hintText: 'Email ID'),
  );
}
Row quickSign(
    { required Function googleProcess,
      required Function appleProcess,
      required Function microsoftProcess,required BuildContext context}) {
  ScreenSize().init(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          height: screenHeight(50),
          width: screenWidth(50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight(15)),
              color: AppColor.purplyBlue.withOpacity(.05)),
          child: Center(child: Image.asset(
            'assets/png/google.png', height: screenWidth(20),
            width: screenWidth(20),)),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          height: screenHeight(50),
          width: screenWidth(50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight(15)),
              color: AppColor.purplyBlue.withOpacity(.05)),
          child: Center(child: Image.asset(
            'assets/png/apple-logo.png', height: screenWidth(20),
            width: screenWidth(20),)),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          height: screenHeight(50),
          width: screenWidth(50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight(15)),
              color: AppColor.purplyBlue.withOpacity(.05)),
          child: Center(
              child: Image.asset(
                'assets/png/microsoft.png',
                height: screenWidth(20),
                width: screenWidth(20),
              )),
        ),
      ),
    ],
  );
}