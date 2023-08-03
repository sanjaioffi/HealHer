import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/gender/onboard_appbar.dart';
import '../../../../utils/app_colors.dart';
import '../gender/continue_elevated_button.dart';

class OnBoardNotificationScreen extends StatelessWidget {
  const OnBoardNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do you want to turn \n     on notification?",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              color: AppColor.bluishCyan,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "New weekly healthy reminder",
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: AppColor.santaGrey,
                  ),
                  const Text(
                    "Motivational reminder",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const Divider(
                    color: AppColor.santaGrey,
                  ),
                  const Text(
                    "Personalised program",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const Divider(
                    color: AppColor.santaGrey,
                  ),
                  const ContinueElevatedButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
