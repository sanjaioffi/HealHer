import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/src/core/config/constants/constants.dart';
import '../../../../../core/config/routes/route_names.dart';
import '../../../domain/entity/user_entity.dart';
import '../generic/bottom_tile.dart';
import '../generic/continue_elevated_button.dart';

class NameCol extends StatefulWidget {
  const NameCol({super.key});

  @override
  State<NameCol> createState() => _NameColState();
}

class _NameColState extends State<NameCol> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                setState(() {});
              },
            ),
          ),
        ),

        //
        Padding(
          padding: EdgeInsets.only(bottom: 50.h, top: 10.h),
          child: const BottomTile(
            tileContent:
                "Tell us your name to share wit us to better communicate",
          ),
        ),

        //
        ContinueElevatedButton(
          nextRoute: AppRoute.onboardDob,
          canSwitch: userEntity.userName != "",
          errorMessage: "Kindly Let us know your name",
        ),
      ],
    );
  }
}
