import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';

class UserWeight extends StatefulWidget {
  const UserWeight({super.key});

  @override
  State<UserWeight> createState() => _UserWeightState();
}

class _UserWeightState extends State<UserWeight> {
  RulerPickerController? _rulerPickerController;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  int weight = 0;
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight(280),
              child: Image.asset(
                "assets/png/weight.png",
                color: AppColor.purplyBlue,
              ),
            ),
            Text(
              "What is your weight?",
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight(25)),
            ),
            SizedBox(
              height: screenHeight(40),
            ),
            Text("$weight kg",
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: screenHeight(20))),
            SizedBox(
              height: screenHeight(15),
            ),
            RulerPicker(
              controller: _rulerPickerController!,
              beginValue: 0,
              endValue: 500,
              initValue: weight.toInt(),
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
                  weight = value;
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
            const ContinueElevatedButton(),
          ],
        ),
      ),
    );
  }
}
