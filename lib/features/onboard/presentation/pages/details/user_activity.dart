import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/constants.dart';
import '../../../../../config/routes/route_names.dart';
import '../../../../../config/theme/app_colors.dart';
import '../../../domain/model/fitness_model.dart';
import '../../widgets/activitity/active_icons.dart';
import '../../widgets/activitity/dot_indicator.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';

class OnboardActivity extends StatefulWidget {
  const OnboardActivity({super.key});

  @override
  State createState() => _OnboardActivityState();
}

class _OnboardActivityState extends State<OnboardActivity> {
  final fitnessLevel = [
    FitnessLevel(
        level: 0,
        image: 'assets/images/more_active.png',
        title: 'Little or No Activity',
        subtitle: 'Mostly sitting through the day (eg. Desk Job, Bank Teller)'),
    FitnessLevel(
        level: 1,
        image: 'assets/images/more_active.png',
        title: 'Lightly Active',
        subtitle:
            'Mostly standing through the day (eg. Sales Associate, Teacher)'),
    FitnessLevel(
        level: 2,
        image: 'assets/images/more_active.png',
        title: 'Moderately Active',
        subtitle:
            'Mostly walking or doing physical activities through the day (eg. Tour Guide, Waiter)'),
    FitnessLevel(
        level: 3,
        image: 'assets/images/more_active.png',
        title: 'Very Active',
        subtitle:
            'Mostly doing heavy physical activities through the day (eg. Gym Instructor, Construction Worker)'),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //

              const StepIndicator(step: 7),

              //
              const Text(
                "What's your current fitness level?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(top: 35.h),
                child: CarouselSlider.builder(
                  itemCount: fitnessLevel.length,
                  itemBuilder: (BuildContext context, int itemIndex, int i) =>
                      Container(
                    decoration: BoxDecoration(
                      color: AppColor.lightPurplrBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 350.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: ActiveIcons(
                                activityLevel: fitnessLevel[itemIndex].level),
                          ),

                          //
                          Expanded(
                            child: Image.asset(
                              fitnessLevel[itemIndex].image,
                              fit: BoxFit.cover,
                            ),
                          ),

                          //

                          //
                          Text(
                            fitnessLevel[itemIndex].title,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Text(
                              fitnessLevel[itemIndex].subtitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),

                          //
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: ContinueElevatedButton(
                              nextRoute: AppRoute.onboardComplete,
                              canSwitch: true,
                              errorMessage: "",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                      viewportFraction: 0.7,
                      height: 450,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        userEntity.activityIdx = index;
                        _currentIndex = index;
                        setState(() {});
                      }),
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: DotIndicator(currentIndex: _currentIndex),
              )
            ],
          ),
        ),
      ),
    );
  }
}
