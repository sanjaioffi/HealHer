import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_colors.dart';

class WorkoutAppBar extends StatelessWidget {
  const WorkoutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h, bottom: 20.h),
          height: 205.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.heavyPurplyBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
          ),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // widget 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appBarIconWidget(context, Icons.arrow_back_ios),
                    Text("Burn Calories Points",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        )),
                    appBarIconWidget(context, Icons.star),
                  ],
                ),
                // SizedBox(height: 20.h),
                // widget 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.local_fire_department_outlined,
                          size: 40.sp,
                          color: AppColor.white,
                        ),
                        Text(
                          "30",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Burn shop",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 7.w),
                          padding: EdgeInsets.all(5.r),
                          decoration: const BoxDecoration(
                            color: AppColor.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 12.sp,
                            color: AppColor.heavyPurplyBlue,
                          ),
                        )
                      ],
                    )
                  ],
                ),

                // SizedBox(height: 20.h),
                // widget 3
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("level 1",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            )),
                        Text("level 2(50/100)",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    // SizedBox(height: 6.1.h),
                    LinearProgressIndicator(
                      value: 0.5,
                      minHeight: 7.h,
                      backgroundColor: AppColor.white.withOpacity(.4),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(AppColor.white),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector appBarIconWidget(BuildContext context, IconData iconData) {
    return GestureDetector(
      onTap: () =>
          iconData == Icons.arrow_back_ios ? Navigator.pop(context) : (),
      child: Container(
        height: 40.h,
        width: 40.w,
        padding: iconData == Icons.arrow_back_ios
            ? EdgeInsets.only(left: 7.r)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.white,
            width: .5.w,
          ),
        ),
        child: Icon(iconData, color: AppColor.white),
      ),
    );
  }
}
