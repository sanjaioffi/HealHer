import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import '../../../../common/screen_utils/screen_size.dart';

class OnBoardHeight extends StatefulWidget {
  const OnBoardHeight({super.key});

  @override
  State<OnBoardHeight> createState() => _OnBoardHeightState();
}

class _OnBoardHeightState extends State<OnBoardHeight> {
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
            height: screenHeight(280),
            child: Image.asset(
              "assets/png/height.png",
            ),
          ),
          Text("$height cm",
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: screenHeight(20))),
          SizedBox(
            height: screenHeight(15),
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
            height: screenHeight(50),
          ),
          const ContinueElevatedButton(nextRoute: '/weight',),
        ],
      ),
    );
  }
}