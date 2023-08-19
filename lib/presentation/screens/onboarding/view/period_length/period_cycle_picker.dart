import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class PeriodCyclePicker extends StatefulWidget {
  const PeriodCyclePicker({super.key});

  @override
  State<PeriodCyclePicker> createState() => _PeriodCyclePickerState();
}

class _PeriodCyclePickerState extends State<PeriodCyclePicker> {
  int selectedIndex = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(35),
      ),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: selectedIndex,
          viewportFraction: 0.6,
          height: screenHeight(120),
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollDirection: Axis.vertical,
          onPageChanged: (index, reason) => setState(() {
            selectedIndex = index;
          }),
        ),
        itemCount: 30,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
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
              width: double.maxFinite,
              height: screenHeight(60),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  selectedIndex == itemIndex
                      ? Text(
                          'Days',
                          style: TextStyle(
                            color: AppColor.heavyPurplyBlue,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight(17),
                          ),
                        )
                      : const SizedBox(),
                  Text(
                    itemIndex.toString(),
                    style: TextStyle(
                      color: AppColor.heavyPurplyBlue,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight(17),
                    ),
                  ),
                  const SizedBox()
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
