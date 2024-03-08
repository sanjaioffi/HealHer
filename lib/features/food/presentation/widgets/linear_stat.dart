import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearStatDetail extends StatelessWidget {
  //
  const LinearStatDetail({
    super.key,
    this.linearTileProgressColor = Colors.green,
    required this.linearTileTitle,
    required this.linearTileMaxProgress,
    required this.linearTileCurrentProgress,
  });

  final String linearTileTitle;
  final double linearTileMaxProgress;
  final double linearTileCurrentProgress;
  final Color linearTileProgressColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w, right: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                linearTileTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.5.h),
                child: SizedBox(
                  height: 8.h,
                  width: 85.w,
                  child: LinearProgressIndicator(
                    minHeight: .1.h,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    value: (linearTileMaxProgress - linearTileCurrentProgress) /
                        100,
                    color: linearTileProgressColor.withOpacity(.65),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(
                  "${linearTileCurrentProgress.toInt()}/${linearTileMaxProgress.toInt()}g",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
