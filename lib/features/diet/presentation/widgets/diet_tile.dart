import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietTile extends StatelessWidget {
  const DietTile({
    super.key,
    required this.dietStatValue,
    required this.dietStatTitle,
    this.isRightToLeft = true,
  });

  final String dietStatValue;
  final String dietStatTitle;
  final bool isRightToLeft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isRightToLeft
          ? EdgeInsets.only(left: 2.w, right: 3.w)
          : EdgeInsets.only(
              left: 2.w,
              right: 8.w,
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dietStatValue,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            dietStatTitle,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
