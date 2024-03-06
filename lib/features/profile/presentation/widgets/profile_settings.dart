import 'package:flutter/material.dart';
import 'package:heal_her/features/profile/presentation/widgets/profile_settings_tile.dart';

class ProfileSettingsSection extends StatelessWidget {
  const ProfileSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
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
        ProfileSettingsTile(
          tileTitle: "Update Preferences",
          tileIcon: Icons.update_outlined,
        ),
        ProfileSettingsTile(
          tileTitle: "Activity",
          tileIcon: Icons.local_activity_outlined,
        ),
        ProfileSettingsTile(
          tileTitle: "Log Out",
          tileIcon: Icons.logout_outlined,
        ),
      ],
    );
  }
}
