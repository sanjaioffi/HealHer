import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/bottom_tile.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/step_indicator.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/top_tile.dart';
import '../../../../../config/theme/screen_size.dart';

class OnBoardingNameScreen extends StatelessWidget {
  const OnBoardingNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StepIndicator(step: 1),
            const TopTile(tileContent: "Share your name with us !"),
            Image.asset(
              "assets/png/happy.png",
              height: 250.h,
              width: 250.w,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 55.w, vertical: 20.h),
              height: 55.h,
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
                vertical: 2.h,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(45.h)),
              child: TextField(
                autofocus: true,
                style: TextStyle(
                  fontSize: 17.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade800,
                ),
                decoration: const InputDecoration(
                  hintText: "Enter Your Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            const BottomTile(
              tileContent:
                  "Tell us your name to share wit us to better communicate",
            ),
            SizedBox(
              height: 50.h,
            ),
            const ContinueElevatedButton(
              nextRoute: '/dob',
            ),
          ],
        ),
      ),
    );
  }
}
