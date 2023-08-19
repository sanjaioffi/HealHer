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
    _rulerPickerController = RulerPickerController(value: 0);
    height = 152;
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
      ),
      child: Column(
        children: [
          Text("${height - 2} cm",
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
              endValue: 500,
              initValue: height.toInt(),
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
                userInfoModel.weight = value.toDouble();
                setState(
                  () {
                    userInfoModel.weight = value.toDouble();
                    setState(
                      () {
                        if (value > 2) {
                          height = value;
                        } else {
                          height = 2;
                        }
                      },
                    );
                  },
                );
              },
              width: MediaQuery.of(context).size.width,
              height: screenHeight(100),
              rulerMarginTop: 7,
              rulerBackgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
