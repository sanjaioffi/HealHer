import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/constants.dart';
import '../../../../../config/routes/route_names.dart';
import '../../../../../config/theme/app_colors.dart';
import '../../pages/details/calculate_age.dart';
import '../generic/continue_elevated_button.dart';

class DobCol extends StatefulWidget {
  const DobCol({super.key});

  @override
  State<DobCol> createState() => _DobColState();
}

class _DobColState extends State<DobCol> {
  late DateTime dateToday;
  @override
  void initState() {
    super.initState();
    dateToday = checkTime;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              DatePickerBdaya.showDatePicker(
                context,
                minTime: DateTime(1920, 5, 1),

                //
                maxTime: DateTime.now().subtract(const Duration(days: 365 * 5)),

                //
                theme: DatePickerThemeBdaya(
                  headerColor: Colors.white,
                  backgroundColor: Colors.white,
                  itemStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  doneStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                onConfirm: (date) {
                  setState(() {
                    // UI Update
                    dateToday = date;

                    // Entity Update
                    userEntity.userDob = date;
                    userEntity.userAge = calculateAge(date);
                  });
                },
                currentTime: checkTime,
                locale: LocaleType.en,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 55.h,
              width: 250.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.heavyPurplyBlue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                  15.h,
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
                      fontSize: 16.h,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ),

        // Elevation Button
        Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: ContinueElevatedButton(
            errorMessage: "Let us know your Date of Birth",
            canSwitch: userEntity.userAge != 0,
            nextRoute: AppRoute.onboardHeight,
          ),
        ),
      ],
    );
  }
}
