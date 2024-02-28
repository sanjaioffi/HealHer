import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';
import '../../../../../config/theme/screen_size.dart';

class OnBoardHeightScreen extends StatefulWidget {
  const OnBoardHeightScreen({super.key});

  @override
  State<OnBoardHeightScreen> createState() => _OnBoardHeightScreenState();
}

class _OnBoardHeightScreenState extends State<OnBoardHeightScreen> {
  late RulerPickerController _rulerPickerController;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  int height = 120;

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const StepIndicator(step: 4),
          const TopTile(tileContent: "Tell us what's our hieght ?"),
          SizedBox(
            height: 280.h,
            child: Image.asset(
              "assets/png/height.png",
            ),
          ),
          Text("$height cm",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp)),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: RulerPicker(
              controller: _rulerPickerController,
              beginValue: 0,
              endValue: 300,
              initValue: height + 1,
              scaleLineStyleList: [
                ScaleLineStyle(
                    color: Colors.black.withOpacity(.6),
                    width: 1.5,
                    height: 30,
                    scale: 0),
                const ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 25, scale: 5),
                const ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 15, scale: -1)
              ],
              onValueChange: (value) {
                setState(() {
                  height = value;
                });
              },
              width: MediaQuery.of(context).size.width,
              height: 80,
              rulerMarginTop: 7,
              rulerBackgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          const ContinueElevatedButton(
            nextRoute: '/weight',
          ),
        ],
      ),
    );
  }
}
