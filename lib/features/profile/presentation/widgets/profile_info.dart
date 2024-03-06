import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/services/services.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'package:heal_her/features/profile/presentation/controller/profile_controller.dart';

import 'package:heal_her/features/profile/presentation/widgets/profile_details_tile.dart';
import 'package:heal_her/features/profile/presentation/widgets/profile_user_info.dart';

final ProfileController profileController = serviceLocator<ProfileController>();

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
              // Profile User Data
              ProfileUserData(
                userName: profileController.userProfileData['userName'],
                userMailId: "mitun-suresh@gmail.com",
              ),

              // Profile Data
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Height
                      ProfileTileData(
                        profileTileTitle: "Height",
                        profileTileData: profileController
                            .userProfileData['userHeight']
                            .toString(),
                        profileTileSuffix: "cm",
                      ),

                      // Weight
                      ProfileTileData(
                        profileTileTitle: "Weight",
                        profileTileData: profileController
                            .userProfileData['userWeight']
                            .toString(),
                        profileTileSuffix: "Kg",
                      ),

                      //
                      ProfileTileData(
                        profileTileTitle: "Age",
                        profileTileData: profileController
                            .userProfileData['userAge']
                            .toString(),
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
