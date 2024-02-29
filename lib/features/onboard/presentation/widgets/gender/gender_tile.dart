import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heal_her/features/onboard/domain/entity/user_entity.dart';
import 'package:heal_her/features/onboard/presentation/controller/gender_controller.dart';
import 'package:heal_her/config/theme/app_colors.dart';

class GenderTile extends StatelessWidget {
  const GenderTile({
    super.key,
    required this.isMale,
  });

  final bool isMale;

  @override
  Widget build(BuildContext context) {
    Get.put(GenderController());
    return GetX<GenderController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.isMale.value = isMale;
            userEntity.userIsMale = isMale;
          },
          child:

              //
              Container(
            margin: EdgeInsets.only(left: 15.w, right: 10.w),
            height: 230.h,
            width: 170.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                colors: isMale && controller.isMale.value
                    ? AppColor.selectedLinearGradient
                    : !isMale && !controller.isMale.value
                        ? AppColor.selectedLinearGradient
                        : AppColor.unselectedLinearGradient,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
              boxShadow: [
                //
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 10.r,
                  spreadRadius: .1,
                  offset: const Offset(1, 5),
                ),
              ],
            ),

            //
            child: Padding(
              padding: EdgeInsets.only(top: 15.h),
              child:

                  //
                  Column(
                children: [
                  Image.asset(
                    height: 150.h,
                    fit: BoxFit.cover,
                    isMale
                        ? "assets/images/onboard_male.png"
                        : "assets/images/onboard_female.png",
                  ),

                  //
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: Text(
                      isMale ? "Male" : "Female",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isMale && controller.isMale.value
                            ? Colors.white
                            : !isMale && !controller.isMale.value
                                ? Colors.white
                                : AppColor.heavyPurplyBlue,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),

                  //
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
