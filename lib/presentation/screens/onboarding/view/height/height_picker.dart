import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:heal_her/presentation/common/screen_utils/screen_size.dart';
import 'package:heal_her/presentation/screens/onboarding/model/userinfo_model.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

class HeightPicker extends StatefulWidget {
  const HeightPicker({super.key});

  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  late RulerPickerController _rulerPickerController;
  late int height;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 120);
    height = 120;
  }

  @override
  void dispose() {
    super.dispose();
    _rulerPickerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${height - 3} cm",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: screenHeight(20),
          ),
        ),
        SizedBox(
          height: screenHeight(15),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(25),
          ),
          child: RulerPicker(
            controller: _rulerPickerController,
            beginValue: 0,
            endValue: 300,
            initValue: height,
            scaleLineStyleList: [
              ScaleLineStyle(
                color: AppColor.heavyPurplyBlue,
                width: screenWidth(1.5),
                height: screenHeight(30),
                scale: 0,
              ),
              ScaleLineStyle(
                color: AppColor.purplyBlue,
                width: screenWidth(1),
                height: screenHeight(25),
                scale: 5,
              ),
            ],
            onValueChange: (value) {
              userInfoModel.height = value.toDouble();
              setState(() {
                height = value;
              });
            },
            width: MediaQuery.of(context).size.width,
            height: screenHeight(80),
            rulerMarginTop: screenHeight(7),
            rulerBackgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
