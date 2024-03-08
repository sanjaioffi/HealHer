import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData({
    super.key,
    required this.userName,
    required this.userMailId,
  });

  final String userName;
  final String userMailId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: const AssetImage('assets/png/happy.png'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            userName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Text(
          userMailId,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 3,
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
