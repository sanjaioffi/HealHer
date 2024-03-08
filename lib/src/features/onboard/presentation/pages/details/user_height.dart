import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/src/core/config/constants/constants.dart';
import '../../../../../core/config/routes/route_names.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';

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

  int height = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const StepIndicator(step: 3),

          //
          const TopTile(tileContent: "Tell us what's your height ?"),

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
              beginValue: 20,
              endValue: 240,
              initValue: height,
              scaleLineStyleList: [
                //

                //
                ScaleLineStyle(
                  color: Colors.black.withOpacity(.6),
                  width: 1.5,
                  height: 30.h,
                  scale: 0,
                ),
                ScaleLineStyle(
                  color: Colors.grey,
                  width: 1.w,
                  height: 25.h,
                  scale: 5,
                ),
                ScaleLineStyle(
                  color: Colors.grey,
                  width: 1.w,
                  height: 15.h,
                  scale: -1,
                )
              ],
              onValueChange: (value) {
                setState(() {
                  height = value;
                  userEntity.userHeight = value.toDouble();
                });
              },
              width: MediaQuery.of(context).size.width,
              height: 80,
              rulerMarginTop: 7,
              rulerBackgroundColor: Colors.transparent,
            ),
          ),

          //

          //
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: ContinueElevatedButton(
              nextRoute: AppRoute.onboardWeight,
              canSwitch: true,
              errorMessage: "Choose your height",
            ),
          ),

          //
        ],
      ),
    );
  }
}
