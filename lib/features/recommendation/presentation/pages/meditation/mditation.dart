import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/app_colors.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  late Timer _timer;
  bool isRunning = false;
  int _start = 120;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: FloatingActionButton(
          onPressed: () {
            if (isRunning) {
              setState(() {
                isRunning = false;
              });
              _timer.cancel();
              isRunning = false;
            } else {
              startTimer();
              setState(() {
                isRunning = true;
              });
            }
          },
          child: isRunning
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
        ),
      ),
      //
      appBar: AppBar(
        backgroundColor: AppColor.babyPurplyBlue,
        title: const Text(
          'Mediation Time',
          style: TextStyle(
            color: AppColor.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_start',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
