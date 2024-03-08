import 'package:flutter/material.dart';

import 'widgets/profile_info.dart';
import 'widgets/profile_settings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ProfileInfo(),
          ProfileSettingsSection(),
        ],
      ),
    );
  }
}
