import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/screen_utils/screen_size.dart';
import 'back_ground.dart';

class DateContainer extends StatefulWidget {
  const DateContainer({super.key, required this.days});

  final List days;

  @override
  State<DateContainer> createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return backGroundContainer(
        width: screenWidth(double.infinity),
        horizontal: screenWidth(15),
        vertical: screenHeight(5),
        height: screenHeight(40),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      if (index < widget.days.length - 1) {
                        index++;
                      }
                    });
                  },
                  child: const Icon(Icons.arrow_back_ios)),
              Text(
                '${widget.days[index].day}-${
                    DateFormat('MMM').format(widget.days[index])
                }-${widget.days[index].year}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              index!= 0
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
