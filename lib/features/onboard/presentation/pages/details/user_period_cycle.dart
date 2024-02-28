import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';
import '../../../../../config/theme/app_colors.dart';

class OnboardPeriodScreen extends StatefulWidget {
  const OnboardPeriodScreen({super.key});

  @override
  State<OnboardPeriodScreen> createState() => _OnboardPeriodScreenState();
}

class _OnboardPeriodScreenState extends State<OnboardPeriodScreen> {
  int selectedIndex = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const StepIndicator(step: 3),
              SizedBox(
                  height: 250,
                  child: Image.asset('assets/images/onboard-period.png')),
              const SizedBox(
                height: 50,
              ),
              const TopTile(tileContent: "How long is your period cycle?"),
              const SizedBox(
                height: 50,
              ),
              CarouselSlider.builder(
                  options: CarouselOptions(
                    initialPage: selectedIndex,
                    viewportFraction: 0.6,
                    height: 120,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index, reason) => setState(() {
                      selectedIndex = index;
                    }),
                  ),
                  itemCount: 30,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == itemIndex
                              ? AppColor.lightPurplrBlue
                              : Colors.grey[200],
                        ),
                        width: double.infinity,
                        height: 60,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            selectedIndex == itemIndex
                                ? const Text(
                                    'Days',
                                    style: TextStyle(
                                        color: AppColor.heavyPurplyBlue,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                : const SizedBox(),
                            Text(
                              itemIndex.toString(),
                              style: const TextStyle(
                                  color: AppColor.heavyPurplyBlue,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            const SizedBox()
                          ],
                        )),
                      ),
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              const ContinueElevatedButton(
                nextRoute: '/last_period_date',
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
