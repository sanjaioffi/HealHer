import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTileData extends StatelessWidget {
  const ProfileTileData({
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
              ),
            ),
            RichText(
              text: TextSpan(
                text: profileTileData,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
                children: [
                  TextSpan(
                    text: ' $profileTileSuffix',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
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
                  width: 50.w,
                ),
              )
            : const SizedBox(),

        //
      ],
    );
  }
}
