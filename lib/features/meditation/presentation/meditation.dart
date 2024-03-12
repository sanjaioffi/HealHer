import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
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
  final player = AudioPlayer();

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
      backgroundColor: AppColor.white,
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
              player.pause();
            } else {
              startTimer();
              setState(() async {
                isRunning = true;

                await player
                    .play(UrlSource('https://example.com/my-audio.wav'));
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
        backgroundColor: AppColor.white,
        // title: const Text(
        //   'Mediation Time',
        //   style: TextStyle(
        //     color: AppColor.white,
        //   ),
        // ),
        // centerTitle: true,
      ),
      // https://cdn.pixabay.com/download/audio/2022/06/10/audio_1b76478b26.mp3?filename=frequency-of-sleep-meditation-113050.mp3
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Meditation',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35.sp,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.heavyPurplyBlue,
                decorationThickness: 2.h,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Guided by a short introductory sound,\n start trying to focus on your breath. follow for 40 minutes.",
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColor.santaGrey.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            Image.network(
                "https://i.pngimg.me/thumb/f/720/fcb30b0873184adcb292.jpg"),
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
