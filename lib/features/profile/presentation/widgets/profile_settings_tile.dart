import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSettingsTile extends StatelessWidget {
  const ProfileSettingsTile({
    super.key,
    required this.tileTitle,
    required this.tileIcon,
    this.isTileFirst = false,
  });

  final String tileTitle;
  final IconData tileIcon;
  final bool isTileFirst;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !isTileFirst
          ? EdgeInsets.symmetric(vertical: 5.h)
          : EdgeInsets.only(top: 10.h, bottom: 5.h),
      child: ListTile(
        leading: Icon(
          tileIcon,
          color: Colors.black,
        ),
        title: Text(
          tileTitle,
          style: const TextStyle(color: Colors.black),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
        onTap: () {},
      ),
    );
  }
}
