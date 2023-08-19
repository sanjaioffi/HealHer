import 'package:flutter/material.dart';
import 'package:heal_her/presentation/utils/app_colors.dart';

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
