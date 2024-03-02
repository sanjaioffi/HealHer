// ignore_for_file: library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'package:heal_her/features/onboard/domain/model/fitness_model.dart';
import 'package:heal_her/features/onboard/presentation/widgets/activitity/active_icons.dart';
import 'package:heal_her/features/onboard/presentation/widgets/activitity/dot_indicator.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/step_indicator.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final fitnessLevel = [
    FitnessLevel(
        level: 0,
        image: 'assets/images/activity_images/more_active.png',
        title: 'Little or No Activity',
        subtitle: 'Mostly sitting through the day (eg. Desk Job, Bank Teller)'),
    FitnessLevel(
        level: 1,
        image: 'assets/images/activity_images/more_active.png',
        title: 'Lightly Active',
        subtitle:
            'Mostly standing through the day (eg. Sales Associate, Teacher)'),
    FitnessLevel(
        level: 2,
        image: 'assets/images/activity_images/more_active.png',
        title: 'Moderately Active',
        subtitle:
            'Mostly walking or doing physical activities through the day (eg. Tour Guide, Waiter)'),
    FitnessLevel(
        level: 3,
        image: 'assets/images/activity_images/more_active.png',
        title: 'Very Active',
        subtitle:
            'Mostly doing heavy physical activities through the day (eg. Gym Instructor, Construction Worker)'),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildOnBoardNavBar(context, 9),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const StepIndicator(step: 9),
                const SizedBox(
                  width: 350,
                  child: Text(
                    "What's your current fitness level?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Image.asset('assets/png/work.png'),
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider.builder(
                  itemCount: fitnessLevel.length,
                  itemBuilder: (BuildContext context, int itemIndex, int i) =>
                      Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.lightPurplrBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            ActiveIcons(
                              activityLevel: fitnessLevel[itemIndex].level,
                            ),
                            Expanded(
                              child: Image.asset(
                                fitnessLevel[itemIndex].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.purplyBlue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Text(
                              fitnessLevel[itemIndex].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(fitnessLevel[itemIndex].subtitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            const ContinueElevatedButton(
                              nextRoute: 'medical_condition',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
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
                        _currentIndex = index;
                        setState(() {});
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                DotIndicator(currentIndex: _currentIndex)
              ],
            ),
          ),
        ));
  }
}
