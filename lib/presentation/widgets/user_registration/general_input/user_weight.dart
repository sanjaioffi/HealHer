import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import '../../../common/screen_utils/screen_size.dart';
import '../../../themes/app_colors.dart';
import '../../button_style/common_button.dart';

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
                    fontSize: screenHeight(16),
                    fontWeight: FontWeight.bold,
                    color: AppColor.purplyBlue.withOpacity(.9),
                  ))),
        ],
        centerTitle: true,
        title: Text("user weight",
            style: TextStyle(
              fontSize: screenHeight(20),
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
              height: screenHeight(280),
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
                  fontSize: screenHeight(15)),
            ),
            Text(
              "What is your weight?",
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight(25)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            vertical: screenHeight(12),
                            horizontal: screenWidth(30))),
                        side: MaterialStatePropertyAll(BorderSide(
                            width: screenWidth(1),
                            color: Colors.grey.shade300)),
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
                            fontSize: screenHeight(20)),
                      )),
                  SizedBox(
                    width: screenWidth(15),
                  ),
                  FilledButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            vertical: screenHeight(12),
                            horizontal: screenWidth(30))),
                        side: MaterialStatePropertyAll(BorderSide(
                            width: screenWidth(1),
                            color: Colors.grey.shade300)),
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
                            fontSize: screenHeight(20)),
                      )),
                ],
              ),
            ),
            Text(kg ? "$weight kg" : "$weight lbs",
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
            commonButton(
                function: () {},
                text: "Continue",
                context: context)
          ],
        ),
      ),
    );
  }
}
