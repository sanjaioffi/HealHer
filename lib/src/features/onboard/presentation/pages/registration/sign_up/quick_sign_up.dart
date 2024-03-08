import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/config/theme/app_colors.dart';

class QuickSignUp extends StatelessWidget {
  const QuickSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.h),
                color: AppColor.purplyBlue.withOpacity(.05)),
            child: Center(
              child: Image.asset(
                'assets/png/google.png',
                height: 20.h,
                width: 20.w,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.h),
                color: AppColor.purplyBlue.withOpacity(.05)),
            child: Center(
                child: Image.asset(
              'assets/png/apple-logo.png',
              height: 20.w,
              width: 20.w,
            )),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.h),
                color: AppColor.purplyBlue.withOpacity(.05)),
            child: Center(
              child: Image.asset(
                'assets/png/microsoft.png',
                height: 20.w,
                width: 20.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
