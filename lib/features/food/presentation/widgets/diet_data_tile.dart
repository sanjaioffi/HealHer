import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietTileData extends StatelessWidget {
  const DietTileData({
    super.key,
    required this.profileTileTitle,
    required this.profileTileData,
    required this.profileTileSuffix,
    this.isLastTile = false,
  });

  final String profileTileTitle;
  final String profileTileData;
  final String profileTileSuffix;
  final bool isLastTile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: [
            Text(
              profileTileTitle,
              style: TextStyle(
                color: Colors.white,
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
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 15.sp,
                  ),
                  children: [
                    TextSpan(
                      text: ' $profileTileSuffix',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
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
                  color: Colors.white,
                  thickness: 1,
                  width: 45.w,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
