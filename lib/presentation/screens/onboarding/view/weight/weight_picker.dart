import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/onboarding/model/userinfo_model.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({super.key});

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  late RulerPickerController _rulerPickerController;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  int weight = 32;
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
                userInfoModel.weight = value.toDouble();
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
        ],
      ),
    );
  }
}
