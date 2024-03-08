import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'back_ground.dart';

class DateContainer extends StatefulWidget {
  const DateContainer({super.key, required this.periodType});

  final Period periodType;

  @override
  State<DateContainer> createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  int index = 0;

  List<DateTime> days = List.generate(7, (index) {
    return DateTime.now().subtract(Duration(days: index));
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return backGroundContainer(
        width: double.maxFinite,
        horizontal: 15.w,
        vertical: 5.h,
        height: 40.h,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (index < days.length - 1) {
                        index++;
                      }
                    });
                  },
                  child: const Icon(Icons.arrow_back_ios)),
              Text(
                '${days[index].day}-${DateFormat('MMM').format(days[index])}-${days[index].year}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              index != 0
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          if (index > 0) {
                            index--;
                          }
                        });
                      },
                      child: const Icon(Icons.arrow_forward_ios))
                  : const SizedBox(),
            ],
          ),
        ));
  }
}
