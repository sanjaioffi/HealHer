// ignore_for_file: prefer_generic_function_type_aliases, library_private_types_in_public_api

library horizontal_calendar;

import 'package:flutter/material.dart';

import 'calender_button.dart';
import 'calender_item.dart';
import 'formatting.dart';

typedef OnDateSelected(date);

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({
    Key? key,
    required this.date,
    this.initialDate,
    this.lastDate,
    this.textColor,
    this.backgroundColor,
    this.selectedColor,
    this.showMonth = false,
    required this.onDateSelected, this.dateBackgroundColor,
  }) : super(key: key);

  final DateTime date;
  final DateTime? initialDate /*!*/;
  final DateTime? lastDate /*!*/;
  final Color? textColor /*!*/;
  final Color? backgroundColor /*!*/;
  final Color? dateBackgroundColor /*!*/;
  final Color? selectedColor /*!*/;
  final bool showMonth;
  final OnDateSelected onDateSelected;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<HorizontalCalendar> {
  late DateTime _startDate;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    selectedDate = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 100;
    _startDate = selectedDate.subtract(const Duration(days: 3));

    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(12)),
      height: height * (widget.showMonth ? 12 : 10),
      child: ListTile(
        dense: true,
        title: widget.showMonth
            ? Text(
                DateParser.getMonth(selectedDate),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: widget.selectedColor ??
                          Theme.of(context).primaryColor,
                    ),
              )
            : const Offstage(),
        subtitle: Row(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CalendarItems(
                    index: index,
                    startDate: _startDate,
                    initialDate: widget.initialDate ?? DateTime.now(),
                    selectedDate: selectedDate,
                    textColor: widget.textColor ?? Colors.black45,
                    selectedColor:
                        widget.selectedColor ?? Theme.of(context).primaryColor,
                    backgroundColor: widget.backgroundColor ?? Colors.white,
                    onDatePressed: () =>
                        onDatePressed(index, widget.initialDate), dateBackgroundColor:widget.dateBackgroundColor ?? Colors.white,
                  );
                },
              ),
            ),
            CalendarButton(
              textColor: widget.textColor ?? Colors.black45,
              backgroundColor: widget.backgroundColor ?? Colors.white,
              onCalendarPressed: () async {
                DateTime? date = await selectDate();
                if (date != null) {
                  widget.onDateSelected(DateParser.getDate(date));
                  setState(() => selectedDate = date);
                }
              },
            ),
          ],
        ),
      ),
    );
  }



  Future<DateTime?> selectDate() async {
    return await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: selectedDate,
      firstDate: widget.initialDate ?? DateTime.now(),
      lastDate: widget.lastDate ?? DateTime.now().add(const Duration(days: 90)),
    );
  }

  void onDatePressed(int index, DateTime? initialDate) {
    DateTime date = _startDate.add(Duration(days: index));
    int checkDate =
        date.difference(widget.initialDate ?? DateTime.now()).inDays;
    if (checkDate >= 0) {
      widget.onDateSelected(DateParser.getDate(date));
      setState(() {
        selectedDate = _startDate.add(Duration(days: index));
        _startDate = _startDate.add(Duration(days: index));
      });
    }
  }
}
