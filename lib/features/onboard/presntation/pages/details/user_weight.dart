import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heal_her/features/onboard/presntation/widgets/continue_elevated_button.dart';
import '../../../../../config/theme/screen_size.dart';
import 'package:heal_her/config/theme/app_colors.dart';

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
  bool kg = true;
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("Next",
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.bold,
                    color: AppColor.purplyBlue.withOpacity(.9),
                  ))),
        ],
        centerTitle: true,
        title: Text("user weight",
            style: TextStyle(
              fontSize: 20.h,
              fontWeight: FontWeight.bold,
              color: AppColor.purplyBlue,
            )),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 280.h,
              child: Image.asset(
                "assets/png/weight.png",
                color: AppColor.purplyBlue,
              ),
            ),
            Text(
              "STEP 1/7",
              style: TextStyle(
                  color: AppColor.purplyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.h),
            ),
            Text(
              "What is your weight?",
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.h),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 30.w)),
                        side: MaterialStatePropertyAll(BorderSide(
                            width: 1.w, color: Colors.grey.shade300)),
                        backgroundColor: MaterialStatePropertyAll(
                            kg == false ? AppColor.purplyBlue : Colors.white),
                        shape: MaterialStatePropertyAll(
                          ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          kg = false;
                        });
                      },
                      child: Text(
                        "lbs",
                        style: TextStyle(
                            color: kg == false ? AppColor.white : Colors.black,
                            fontSize: 20.h),
                      )),
                  SizedBox(
                    width: 15.w,
                  ),
                  FilledButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 30.w)),
                        side: MaterialStatePropertyAll(BorderSide(
                            width: 1.w, color: Colors.grey.shade300)),
                        backgroundColor: MaterialStatePropertyAll(
                            kg == true ? AppColor.purplyBlue : Colors.white),
                        shape: MaterialStatePropertyAll(
                          ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          kg = true;
                        });
                      },
                      child: Text(
                        "Kg",
                        style: TextStyle(
                            color: kg == true ? AppColor.white : Colors.black,
                            fontSize: 20.h),
                      )),
                ],
              ),
            ),
            Text(kg ? "$weight kg" : "$weight lbs",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.h)),
            SizedBox(
              height: 15.h,
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
              height: 50.h,
            ),
            const ContinueElevatedButton(
              nextRoute: '/food_type',
            )
          ],
        ),
      ),
    );
  }
}
