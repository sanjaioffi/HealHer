import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import '../../../../common/screen_utils/screen_size.dart';

class OnboardWeight extends StatefulWidget {
  const OnboardWeight({super.key});

  @override
  State<OnboardWeight> createState() => _OnboardWeightState();
}

class _OnboardWeightState extends State<OnboardWeight> {
  late RulerPickerController _rulerPickerController;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  int weight = 32;
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 5),
      body: Column(
        children: [
          const StepIndicator(step: 5),
          const TopTile(tileContent: "What's your Weight ?"),
          Image.asset(
            "assets/png/weight.png",
            height: screenHeight(250),
            width: screenWidth(250),
          ),
          SizedBox(
            height: screenHeight(15),
          ),
          Text("${weight - 2} kg",
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: screenHeight(20))),
          SizedBox(
            height: screenHeight(15),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: RulerPicker(
              controller: _rulerPickerController,
              beginValue: 0,
              endValue: 400,
              initValue: weight.toInt(),
              scaleLineStyleList: const [
                ScaleLineStyle(
                  color: Colors.grey,
                  width: 1.5,
                  height: 30,
                  scale: 0,
                ),
                ScaleLineStyle(
                  color: Colors.grey,
                  width: 1,
                  height: 25,
                  scale: 5,
                ),
              ],
              onValueChange: (value) {
                setState(() {
                  weight = value;
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
          const ContinueElevatedButton(
            nextRoute: '/food_type',
          ),
        ],
      ),
    );
  }
}
