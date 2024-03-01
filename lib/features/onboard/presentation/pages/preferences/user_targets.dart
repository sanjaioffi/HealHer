import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../widgets/generic/continue_elevated_button.dart';
import '../../widgets/generic/onboard_appbar.dart';
import '../../widgets/generic/step_indicator.dart';

class OnboardTargetScreen extends StatefulWidget {
  const OnboardTargetScreen({super.key});
  @override
  State createState() => _OnboardTargetScreenState();
}

class _OnboardTargetScreenState extends State<OnboardTargetScreen> {
  Set<int> selectedLevels = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildOnBoardNavBar(context, 8),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const StepIndicator(step: 8),
                Text(
                  "Help Us know your goal !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                  child: const Text('You always can change this later',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/food.png',
                  text: 'Weight loss',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? selectedLevels.add(1)
                        : selectedLevels.remove(1);
                  },
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/sleeping.png',
                  text: 'Better sleeping habit',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? selectedLevels.add(2)
                        : selectedLevels.remove(2);
                  },
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/nutirition.png',
                  text: 'Track my nutrition',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? selectedLevels.add(3)
                        : selectedLevels.remove(3);
                  },
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/muscle.png',
                  text: 'Improve overall fitness',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? selectedLevels.add(4)
                        : selectedLevels.remove(4);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: const ContinueElevatedButton(
                    nextRoute: '/medical_condition',
                    canSwitch: true,
                    errorMessage: "",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomCard extends StatefulWidget {
  final String iconImage;
  final String text;
  final ValueSetter<bool?>? onCheckboxChanged;

  const CustomCard({
    super.key,
    required this.iconImage,
    required this.text,
    this.onCheckboxChanged,
  });

  @override
  State createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onCheckboxChanged!(_isChecked);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              blurRadius: 10,
              spreadRadius: .1,
              offset: const Offset(1, 5),
            )
          ],
          color: _isChecked ? AppColor.heavyPurplyBlue : Colors.white,
        ),
        height: 80,
        child: Center(
          child: ListTile(
            leading: Image.asset(widget.iconImage, width: 30, height: 30),
            title: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _isChecked ? Colors.white : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Container(
              alignment: Alignment.center,
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              child: Checkbox(
                checkColor: AppColor.purplyBlue,
                visualDensity: VisualDensity.comfortable,
                activeColor: Colors.white,
                value: _isChecked,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: BorderSide.none,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue ?? false;
                  });

                  if (widget.onCheckboxChanged != null) {
                    widget.onCheckboxChanged!(_isChecked);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
