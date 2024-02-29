import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/routes/route_names.dart';
import '../../../domain/entity/user_entity.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';
import '../../widgets/generic/top_tile.dart';

class OnBoardWeightScreen extends StatefulWidget {
  const OnBoardWeightScreen({super.key});

  @override
  State<OnBoardWeightScreen> createState() => _OnBoardWeightScreenState();
}

class _OnBoardWeightScreenState extends State<OnBoardWeightScreen> {
  RulerPickerController? _rulerPickerController;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
  }

  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 4),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const StepIndicator(step: 4),

              //
              const TopTile(tileContent: "Tell us what's your Wieght ?"),

              //
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: SizedBox(
                  height: 200.h,
                  child: Image.asset(
                    "assets/images/onboard_weight.png",
                  ),
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  bottom: 15.h,
                ),
                child: Text("${weight - 2} kg",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    )),
              ),

              //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: RulerPicker(
                  controller: _rulerPickerController!,
                  beginValue: 0,
                  endValue: 120,
                  initValue: weight.toInt(),
                  scaleLineStyleList: [
                    ScaleLineStyle(
                      color: Colors.grey,
                      width: 1.5.w,
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
                      weight = value;
                    });
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 80.h,
                  rulerMarginTop: 7,
                  rulerBackgroundColor: Colors.transparent,
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(top: 60.h),
                child: ContinueElevatedButton(
                  nextRoute: AppRoute.onboardGender,
                  canSwitch: userEntity.userWeight != -1,
                  errorMessage: "Kindly pick your weight",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
