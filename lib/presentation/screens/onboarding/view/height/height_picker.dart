import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/onboarding/model/userinfo_model.dart';

class HeightPicker extends StatefulWidget {
  const HeightPicker({super.key});

  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  late RulerPickerController _rulerPickerController;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  int height = 120;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$height cm",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: screenHeight(20),
          ),
        ),
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
              userInfoModel.height = value.toDouble();
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
      ],
    );
  }
}
