import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/onboarding/model/userinfo_model.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({super.key});

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  late RulerPickerController _rulerPickerController;
  late int weight;

  @override
  void initState() {
    weight = 62;
    _rulerPickerController = RulerPickerController(value: 0);
    super.initState();
  }

  @override
  void dispose() {
    _rulerPickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight(15),
        bottom: screenHeight(50),
      ),
      child: Column(
        children: [
          Text("${weight - 2} kg",
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: screenHeight(20))),
          SizedBox(
            height: screenHeight(15),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth(20),
            ),
            child: RulerPicker(
              controller: _rulerPickerController,
              beginValue: 0,
              endValue: 400,
              initValue: weight.toInt(),
              scaleLineStyleList: [
                ScaleLineStyle(
                  color: AppColor.heavyPurplyBlue,
                  width: screenWidth(1.5),
                  height: screenHeight(30),
                  scale: 0,
                ),
                ScaleLineStyle(
                  color: AppColor.heavyPurplyBlue,
                  width: screenWidth(1),
                  height: screenHeight(25),
                  scale: 5,
                ),
              ],
              onValueChange: (value) {
                print(value);
                userInfoModel.weight = value.toDouble();
                setState(() {
                  if (value > 2) {
                    weight = value;
                  } else {
                    weight = 2;
                  }
                });
              },
              width: MediaQuery.of(context).size.width,
              height: screenHeight(80),
              rulerMarginTop: 7,
              rulerBackgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
