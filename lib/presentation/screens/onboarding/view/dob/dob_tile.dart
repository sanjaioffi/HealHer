import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';

import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';

class DobSelector extends StatefulWidget {
  const DobSelector({super.key});

  @override
  State<DobSelector> createState() => _DobSelectorState();
}

class _DobSelectorState extends State<DobSelector> {
  late DateTime dateToday;
  @override
  void initState() {
    super.initState();
    dateToday = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          DatePickerBdaya.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1900, 5, 1),
              maxTime: DateTime.now(),
              theme: const DatePickerThemeBdaya(
                headerColor: Colors.white,
                backgroundColor: Colors.white,
                itemStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                doneStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ), onConfirm: (date) {
            setState(() {
              // print("rebuild Done");
              dateToday = date;
            });
            // int age = calculateAge(date);
          }, currentTime: DateTime(2000, 5, 5), locale: LocaleType.en);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          height: screenHeight(55),
          width: screenWidth(250),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.heavyPurplyBlue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(
              screenHeight(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.calendar_month_rounded,
                color: AppColor.heavyPurplyBlue,
              ),
              Text(
                "${dateToday.day.toString()} / ${dateToday.month.toString()} / ${dateToday.year.toString()}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenHeight(16),
                ),
              ),
              const SizedBox(),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
