import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';

import '../../../../utils/app_colors.dart';

class TargetsScreen extends StatefulWidget {
  const TargetsScreen({super.key});
  @override
  State createState() => _TargetsScreenState();
}

class _TargetsScreenState extends State<TargetsScreen> {
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
                const Text(
                  "Let us know how we can help you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('You always can change this later',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    )),
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 20,
                ),
                const ContinueElevatedButton(
                  nextRoute: '/activities',
                ),
                const SizedBox(
                  height: 20,
                )
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