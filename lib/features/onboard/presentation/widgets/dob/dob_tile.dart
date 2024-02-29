import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'package:heal_her/features/onboard/domain/entity/user_entity.dart';
import 'package:heal_her/features/onboard/presentation/pages/details/calculate_age.dart';

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
            userEntity.userDob = date;
            setState(() {
              // print("rebuild Done");
              dateToday = date;
            });
            userEntity.userDob = date;
            userEntity.userAge = calculateAge(date);
            log(userEntity.userAge.toString());
            log(userEntity.userDob.toString());
          }, currentTime: DateTime(2000, 5, 5), locale: LocaleType.en);
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
    );
  }
}
