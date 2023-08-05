// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/activities/activities_screen.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';

import '../../../../utils/app_colors.dart';

class TargetsScreen extends StatefulWidget {
  TargetsScreen({super.key});
  Set<int> selectedLevels = {};
  @override
  _TargetsScreenState createState() => _TargetsScreenState();
}

class _TargetsScreenState extends State<TargetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildOnBoardNavBar(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StepIndicator(step: 2),
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
                        ? widget.selectedLevels.add(1)
                        : widget.selectedLevels.remove(1);
                    print(widget.selectedLevels);
                  },
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/sleeping.png',
                  text: 'Better sleeping habit',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? widget.selectedLevels.add(2)
                        : widget.selectedLevels.remove(2);
                    print(widget.selectedLevels);
                  },
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/nutirition.png',
                  text: 'Track my nutrition',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? widget.selectedLevels.add(3)
                        : widget.selectedLevels.remove(3);
                    print(widget.selectedLevels);
                  },
                ),
                CustomCard(
                  iconImage: 'assets/images/targets_images/muscle.png',
                  text: 'Improve overall fitness',
                  onCheckboxChanged: (bool? newValue) {
                    newValue!
                        ? widget.selectedLevels.add(4)
                        : widget.selectedLevels.remove(4);
                    print(widget.selectedLevels);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ContinueElevatedButton(
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
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onCheckboxChanged!(isChecked);
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
          color: isChecked ? AppColor.heavyPurplyBlue : Colors.white,
        ),
        height: 80,
        child: Center(
          child: ListTile(
              leading: Image.asset(widget.iconImage, width: 30, height: 30),
              title: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isChecked ? Colors.white : Colors.black,
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
                  value: isChecked,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide.none,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue ?? false;
                    });

                    if (widget.onCheckboxChanged != null) {
                      widget.onCheckboxChanged!(isChecked);
                    }
                  },
                ),
              )),
        ),
      ),
    );
  }
}
