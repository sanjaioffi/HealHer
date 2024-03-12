// create a page with ui for female recommendation for periods.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heal_her/config/theme/app_colors.dart';

import '../controller/periods_controller.dart';

class PeriodsRecommendationPage extends StatelessWidget {
  const PeriodsRecommendationPage({super.key});

  static const Map<String, dynamic> periodRecommendations = {
    'General': [
      'Use menstrual products (pads, tampons, menstrual cups, or period underwear)',
      'Take pain relievers (ibuprofen or acetaminophen)',
      'Apply heat (heating pad or warm bath)',
      'Stay hydrated (drink plenty of water and fluids)',
      'Exercise (light exercises like walking or yoga)',
      'Get enough rest',
      'Eat a balanced diet (rich in iron, calcium, and vitamins)',
      'Manage stress (relaxation techniques like deep breathing, meditation, or music)',
      'Wear comfortable clothing',
      'Track your menstrual cycle'
    ],
    'Ayurveda': [
      'Drink warm water with cumin seeds and fennel seeds',
      'Consume ginger, cinnamon, and turmeric tea',
      'Apply warm sesame oil or castor oil on the lower abdomen'
    ],
    'Yoga': [
      'Practice gentle yoga asanas like Baddha Konasana, Supta Virasana, and Balasana',
      'Try pranayama (breathing exercises) like Nadi Shodhana and Bhramari'
    ],
    'Naturopathy': [
      'Take a warm water enema',
      'Apply a warm compress or hot water bottle on the lower abdomen',
      'Consume whole foods rich in iron (leafy greens, nuts, and seeds)'
    ],
    'Unani': [
      'Drink a decoction made with fennel seeds, coriander seeds, and black cumin seeds',
      'Apply a paste of dried pomegranate skin and vinegar on the lower abdomen'
    ],
    'Siddha': [
      'Consume a decoction made with dried ginger, long pepper, and cumin seeds',
      'Apply a warm paste of fenugreek seeds and milk on the lower abdomen'
    ],
    'Homeopathy': [
      'Consider homeopathic remedies like Sepia, Pulsatilla, or Calcarea Carbonica',
      'Magnesium phosphoricum can help relieve menstrual cramps'
    ],
    'General Recommendations': [
      'Stay hydrated by drinking plenty of fluids (warm water, herbal teas, fresh juices)',
      'Avoid caffeine, alcohol, and processed foods',
      'Get adequate rest and practice stress-relieving activities (meditation or light exercises)'
    ]
  };

  @override
  Widget build(BuildContext context) {
    Get.put(PeriodTrackerController());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        title: Text(
          "Periods Recommendation",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<PeriodTrackerController>(builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
                height: 300.h,
                width: 300.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/8224689.jpg")),
                ),
              ),
            ),
            const Text("You are free to do anything you want to do."),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Next Period Date:",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    // calculate next period date
                    Text(
                      calculateNextPeriodDate(
                        controller.lastPeriodData.value,
                        controller.periodCycle.value,
                      ).toString().split(" ")[0],
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Period Cycle:",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${controller.periodCycle.value} days",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView(
                children: periodRecommendations.entries.map((entry) {
                  return ExpansionTile(
                    title: Text(entry.key),
                    children: entry.value.map<Widget>((recommendation) {
                      return ListTile(
                        title: Text(recommendation),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      }),
    );
  }
}

DateTime calculateNextPeriodDate(DateTime lastPeriodDate, int periodCycle) {
  return lastPeriodDate.add(Duration(days: periodCycle));
}
