import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class PeriodLengthScreen extends StatefulWidget {
  const PeriodLengthScreen({super.key});

  @override
  State<PeriodLengthScreen> createState() => _PeriodLengthScreenState();
}

class _PeriodLengthScreenState extends State<PeriodLengthScreen> {
  int _selected_index = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 250,
                  child: Image.asset('assets/images/onboard-period.png')),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  "How long is your period cycle?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CarouselSlider.builder(
                  options: CarouselOptions(
                    initialPage: _selected_index,
                    viewportFraction: 0.6,
                    height: 120,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index, reason) => setState(() {
                      _selected_index = index;
                    }),
                  ),
                  itemCount: 30,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _selected_index == itemIndex
                              ? AppColor.lightPurplrBlue
                              : Colors.grey[200],
                        ),
                        width: double.infinity,
                        height: 60,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _selected_index == itemIndex
                                ? Text(
                                    'Days',
                                    style: TextStyle(
                                        color: AppColor.heavyPurplyBlue,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                : SizedBox(),
                            Text(
                              itemIndex.toString(),
                              style: TextStyle(
                                  color: AppColor.heavyPurplyBlue,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            SizedBox()
                          ],
                        )),
                      ),
                    );
                  }),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Next'))
            ],
          ),
        ),
      ),
    );
  }
}
