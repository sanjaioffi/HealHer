import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/config/theme/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerButton extends StatefulWidget {
  const TimerButton({Key? key}) : super(key: key);

  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  bool _isTimerStarted = false;
  double _percent = 0.0;
  int _seconds = 0;

  void _startTimer() {
    setState(() {
      _isTimerStarted = true;
      _seconds = 60;
    });

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _percent = (_seconds / 60);
        _seconds--;
      });
      return _seconds >= 0;
    }).then((_) {
      setState(() {
        _isTimerStarted = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _isTimerStarted ? null : _startTimer,
        child: SizedBox(
          width: 100.h,
          height: 350.w,
          child: _isTimerStarted
              ? Center(
                  child: CircularPercentIndicator(
                    radius: 30.r,
                    lineWidth: 10.0.w,
                    percent: _percent,
                    center: Text('$_seconds'),
                    progressColor: Colors.green,
                    reverse: true,
                  ),
                )
              : Container(
                  decoration: const BoxDecoration(
                    color: AppColor.purplyBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
        ));
  }
}
