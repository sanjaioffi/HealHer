// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

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
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Text(
              'STEP 1/7',
              style: TextStyle(
                  color: AppColor.purplyBlue,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            const SizedBox(
              height: 10,
            ),
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
              bgImage: 'assets/images/targets_images/orange_bg.jpg',
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
              bgImage: 'assets/images/targets_images/night.jpg',
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
              bgImage: 'assets/images/targets_images/green_bg.jpg',
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
              bgImage: 'assets/images/targets_images/fitness_bg.jpg',
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
            ElevatedButton(onPressed: () {}, child: const Text('select')),
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
  final String bgImage;
  final String iconImage;
  final String text;
  final ValueSetter<bool?>? onCheckboxChanged;

  const CustomCard({
    super.key,
    required this.iconImage,
    required this.bgImage,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          height: 90,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                isChecked
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(widget.bgImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.white,
                      ),
                Align(
                  alignment: Alignment.center,
                  child: ListTile(
                      leading:
                          Image.asset(widget.iconImage, width: 30, height: 30),
                      title: Text(
                        widget.text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isChecked ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Container(
                        alignment: Alignment.center,
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                        child: Checkbox(
                          checkColor: AppColor.purplyBlue,
                          visualDensity: VisualDensity.comfortable,
                          activeColor: Colors.white,
                          value: isChecked,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
