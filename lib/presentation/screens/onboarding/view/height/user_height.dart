import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';

import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';

class UserHeight extends StatefulWidget {
  const UserHeight({super.key});

  @override
  State<UserHeight> createState() => _UserHeightState();
}

class _UserHeightState extends State<UserHeight> {
  RulerPickerController? _rulerPickerController;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  int weight = 0;
  int height = 0;

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight(280),
            child: Image.asset(
              "assets/png/height.png",
            ),
          ),
          Text(
            "What is your height?",
            style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.bold,
                fontSize: screenHeight(25)),
          ),
          Text("$height cm",
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: screenHeight(20))),
          SizedBox(
            height: screenHeight(15),
          ),
          RulerPicker(
            controller: _rulerPickerController!,
            beginValue: 0,
            endValue: 500,
            initValue: height,
            scaleLineStyleList: const [
              ScaleLineStyle(
                  color: Colors.grey, width: 1.5, height: 30, scale: 0),
              ScaleLineStyle(
                  color: Colors.grey, width: 1, height: 25, scale: 5),
              ScaleLineStyle(
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
          SizedBox(
            height: screenHeight(50),
          ),
          const ContinueElevatedButton()
        ],
      ),
    );
  }
}
