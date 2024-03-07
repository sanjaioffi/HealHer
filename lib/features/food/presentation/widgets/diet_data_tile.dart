import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietTileData extends StatelessWidget {
  const DietTileData({
    super.key,
    required this.profileTileTitle,
    required this.profileTileData,
    required this.profileTileSuffix,
    this.isLastTile = false,
    this.isWhiteColor = true,
  });

  final String profileTileTitle;
  final String profileTileData;
  final String profileTileSuffix;
  final bool isLastTile;
  final bool isWhiteColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: [
            Text(
              profileTileTitle,
              style: TextStyle(
                color: isWhiteColor ? Colors.white : Colors.black,
                fontSize: 15.sp,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: RichText(
                text: TextSpan(
                  text: profileTileData,
                  style: TextStyle(
                    color: isWhiteColor ? Colors.white : Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 15.sp,
                  ),
                  children: [
                    TextSpan(
                      text: ' $profileTileSuffix',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: isWhiteColor ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        !isLastTile
            ? SizedBox(
                height: 50.h,
                child: VerticalDivider(
                  color: isWhiteColor ? Colors.white : Colors.black,
                  thickness: 1,
                  width: 45.w,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
