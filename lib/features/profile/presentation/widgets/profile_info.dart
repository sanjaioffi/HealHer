import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'package:heal_her/features/profile/presentation/widgets/profile_details_tile.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColor.heavyPurplyBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 65.h),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/png/happy.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const Text(
                  'Sanjai P',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'sanjaiofficial@gmail.com',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 3,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8.w,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileTileData(
                        profileTileTitle: "Height",
                        profileTileData: "175",
                        profileTileSuffix: "cm",
                      ),
                      ProfileTileData(
                        profileTileTitle: "Weight",
                        profileTileData: "48",
                        profileTileSuffix: "Kg",
                      ),
                      ProfileTileData(
                        profileTileTitle: "Age",
                        profileTileData: "18",
                        profileTileSuffix: "yrs",
                        isLastTile: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataTile extends StatelessWidget {
  const DataTile({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.body,
  });

  final Color backgroundColor;
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              const Icon(
                Icons.directions_walk_rounded,
                color: AppColor.stepsIndicator,
                size: 30,
              ),
            ],
          ),
          const SizedBox(height: 20),
          body,
        ],
      ),
    );
  }
}
