import 'package:flutter/material.dart';
import '../../../../common/screen_utils/screen_size.dart';
import '../widgets/button_style/common_button.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight(125),
            ),
            Center(
              child: Image.asset(
                'assets/png/happy.png',
                height: screenHeight(250),
                width: screenWidth(250),
              ),
            ),
            SizedBox(
              height: screenHeight(14),
            ),
            Text(
              "What is your name?",
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: screenHeight(19)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth(55),vertical: screenHeight(20)),
              height: screenHeight(55),
              padding: EdgeInsets.symmetric(horizontal:screenWidth(25),vertical: screenHeight(2)),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(.1),borderRadius:BorderRadius.circular(screenHeight(45))),
              child: TextField(
                style: TextStyle(fontSize: screenHeight(17),fontWeight: FontWeight.w500,color: Colors.grey.shade800),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: screenHeight(150),),
            commonButton(
                function: () {},
                text: "Continue",
                context: context),
          ],
        ),
      ),
    );
  }
}
