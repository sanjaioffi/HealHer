import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';

import '../../../../common/screen_utils/screen_size.dart';
import '../../../../themes/app_colors.dart';
import '../../../../widgets/button_style/common_button.dart';

class DateOfBirth extends StatefulWidget {
  DateOfBirth({super.key});

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  String date_of_birth = '';
  String age = '';

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight(100),
            ),
            Center(
              child: SizedBox(
                height: screenHeight(250),
                width: screenWidth(250),
                child: Image.asset("assets/gif/Birthday-candles.gif"),
              ),
            ),
            SizedBox(height: screenHeight(35)),
            const Text(
              "Choose your data of birth.",
              style:
                  TextStyle(color: AppColor.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: screenHeight(15)),
            GestureDetector(
              onTap: () {
                DatePickerBdaya.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1990, 1, 1),
                    maxTime: DateTime.now(),
                    theme: const DatePickerThemeBdaya(
                      headerColor: Colors.white,
                      backgroundColor: Colors.white,
                      itemStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      doneStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ), onConfirm: (date) {
                  setState(() {
                    date_of_birth = '${date.day}/${date.month}/${date.year}';
                    age = calculateAge(date).toString();
                  });
                }, currentTime: DateTime(2000, 7, 11), locale: LocaleType.en);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                height: screenHeight(55),
                width: screenWidth(250),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.purplyBlue, width: 2),
                  borderRadius: BorderRadius.circular(screenHeight(45)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(date_of_birth,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight(16))),
                      const Icon(Icons.calendar_month_rounded)
                    ]),
              ),
            ),
            SizedBox(
              height: screenWidth(150),
            ),
            commonButton(
                function: () {

                },
                text: "Continue",
                context: context),
          ],
        ),
      ),
    );
  }

  int calculateAge(DateTime dob) {
    final today = DateTime.now();
    final year = today.year - dob.year;
    final month = today.month - dob.month;
    final day = today.day - dob.day;

    if (month < 0) {
      return year - 1;
    } else if (month == 0 && day < 0) {
      return year - 1;
    } else {
      return year;
    }
  }
}
