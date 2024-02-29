import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/continue_elevated_button.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/onboard_appbar.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/step_indicator.dart';
import 'package:heal_her/features/onboard/presentation/widgets/generic/top_tile.dart';

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
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const StepIndicator(step: 4),

          //
          const TopTile(tileContent: "Tell us what's your hieght ?"),

          //
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SizedBox(
              height: 260.h,
              child: Image.asset(
                "assets/images/onboard_height.png",
              ),
            ),
          ),

          //
          Text("${height - 2} cm",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.sp)),

          //
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: RulerPicker(
              controller: _rulerPickerController,
              beginValue: 0,
              endValue: 240,
              initValue: 120,
              scaleLineStyleList: [
                //

                //
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

          //
          SizedBox(
            height: 50.h,
          ),

          //
          const ContinueElevatedButton(
            nextRoute: '/weight',
          ),

          //
        ],
      ),
    );
  }
}
