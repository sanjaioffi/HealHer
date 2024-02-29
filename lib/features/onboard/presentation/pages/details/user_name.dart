import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/domain/entity/user_entity.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/bottom_tile.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/step_indicator.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/top_tile.dart';

class OnBoardingNameScreen extends StatelessWidget {
  const OnBoardingNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              height: 200.h,
              width: 200.w,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  // color: Colors.black,
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Enter Your Name",
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    userEntity.userName = value;
                    log(userEntity.userName);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60.h),
              child: const BottomTile(
                tileContent:
                    "Tell us your name to share wit us to better communicate",
              ),
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
