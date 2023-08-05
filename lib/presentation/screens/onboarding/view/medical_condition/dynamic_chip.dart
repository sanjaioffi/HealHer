import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../controller/medical_condition_controller.dart';

class DynamicChip extends StatefulWidget {
  final String name;
  const DynamicChip({super.key, required this.name});

  @override
  State createState() => _DynamicChipState();
}

class _DynamicChipState extends State<DynamicChip> {
  bool isImage1Visible = false;
  final MedicalIssuesController medicalIssuesController =
      Get.put(MedicalIssuesController());

  // list of string options

  List<String> tags = [];

  void _toggleColor() {
    medicalIssuesController.addMedicalIssue(widget.name);
    if (tags.contains(widget.name)) {
      tags.remove(widget.name);
    } else {
      tags.add(widget.name);
    }
    setState(() {
      isImage1Visible = !isImage1Visible;
    });

    // print(tags);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleColor,
      child: Chip(
          shadowColor: AppColor.heavyPurplyBlue,
          elevation: 2,
          label: Text(widget.name),
          backgroundColor:
              isImage1Visible ? AppColor.purplyBlue : AppColor.white,
          avatar: isImage1Visible ? const Icon(Icons.check) : null),
    );
  }
}
