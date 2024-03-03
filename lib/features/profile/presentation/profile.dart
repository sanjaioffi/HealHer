import 'package:flutter/material.dart';
import 'package:heal_her/features/profile/presentation/widgets/profile_info.dart';
import 'package:heal_her/features/profile/presentation/widgets/profile_settings_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ProfileInfo(),
          ProfileSettingsTile(
            tileTitle: "Personal Information",
            tileIcon: Icons.person_outline,
            isTileFirst: true,
          ),
          ProfileSettingsTile(
            tileTitle: "Personalise Intensity",
            tileIcon: Icons.golf_course_outlined,
          ),
          ProfileSettingsTile(
            tileTitle: "Help",
            tileIcon: Icons.help_outline,
          ),
          ProfileSettingsTile(
            tileTitle: "Privacy",
            tileIcon: Icons.privacy_tip_outlined,
          ),
        ],
      ),
    );
  }
}
