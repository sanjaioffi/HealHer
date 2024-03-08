// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'formatting.dart';

class CalendarItems extends StatelessWidget {
  const CalendarItems({
    Key? key,
    required this.index,
    required this.startDate,
    required this.initialDate,
    required this.selectedDate,
    required this.textColor,
    required this.dateBackgroundColor,
    required this.selectedColor,
    required this.backgroundColor,
    required this.onDatePressed,
  }) : super(key: key);

  final int index;
  final DateTime startDate;
  final DateTime initialDate;
  final DateTime selectedDate;
  final Color textColor;
  final Color dateBackgroundColor;
  final Color selectedColor;
  final Color backgroundColor;
  final VoidCallback onDatePressed;

  @override
  Widget build(BuildContext context) {
    DateTime date = startDate.add(Duration(days: index));
    int diffDays = date.difference(selectedDate).inDays;
    int checkPastDate = date.difference(initialDate).inDays;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: (width / 100) * 13.8,
      decoration: BoxDecoration(
          color: diffDays != 0 ? backgroundColor : selectedColor,
          borderRadius: BorderRadius.circular(30)),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onDatePressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateParser.getDayOfWeek(date),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: diffDays != 0
                        ? checkPastDate >= 0
                            ? textColor
                            : Colors.grey[300]
                        : Colors.white,
                    fontSize: 10.0,
                  ),
            ),
            const SizedBox(height: 2.0),
            Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: diffDays != 0 ? backgroundColor : dateBackgroundColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  DateParser.getDayOfMonth(date),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: diffDays != 0
                            ? checkPastDate >= 0
                                ? textColor
                                : Colors.grey[300]
                            : Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
