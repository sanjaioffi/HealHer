// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import '../../../../utils/app_colors.dart';
import '../../model/fitness_model.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final fitnessLevel = [
    FitnessLevel(
        level: 0,
        image: 'assets/images/activity_images/no_activity.png',
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
        appBar: buildOnBoardNavBar(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StepIndicator(step: 3),
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
                const SizedBox(
                  height: 20,
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
                            Container(
                                width: 170,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'select',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ))),
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

class ActiveIcons extends StatelessWidget {
  const ActiveIcons({super.key, required this.activityLevel});
  final int activityLevel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: activityLevel == 1
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                            'assets/images/activity_images/flame_active.png'),
                        Image.asset(
                            'assets/images/activity_images/flame_inactive.png'),
                        Image.asset(
                            'assets/images/activity_images/flame_inactive.png')
                      ],
                    )
                  : activityLevel == 2
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                                'assets/images/activity_images/flame_active.png'),
                            Image.asset(
                                'assets/images/activity_images/flame_active.png'),
                            Image.asset(
                                'assets/images/activity_images/flame_inactive.png')
                          ],
                        )
                      : activityLevel == 3
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                    'assets/images/activity_images/flame_active.png'),
                                Image.asset(
                                    'assets/images/activity_images/flame_active.png'),
                                Image.asset(
                                    'assets/images/activity_images/flame_active.png'),
                              ],
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                    'assets/images/activity_images/flame_inactive.png'),
                                Image.asset(
                                    'assets/images/activity_images/flame_inactive.png'),
                                Image.asset(
                                    'assets/images/activity_images/flame_inactive.png')
                              ],
                            ))),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int dotCount;
  final double dotSize;
  final double spacing;
  final Color activeDotColor;
  final Color inactiveDotColor;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    this.dotCount = 4,
    this.dotSize = 10.0,
    this.spacing = 10.0,
    this.activeDotColor = AppColor.purplyBlue,
    this.inactiveDotColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotCount, (index) {
        bool isActive = index == currentIndex;
        return Container(
          width: dotSize,
          height: dotSize,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? activeDotColor : inactiveDotColor,
          ),
        );
      }),
    );
  }
}
