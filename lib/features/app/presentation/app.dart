import 'package:flutter/material.dart';
import 'package:heal_her/features/device/presentation/device.dart';
import 'package:heal_her/features/home/presentation/home.dart';
import 'package:heal_her/features/onboard/presntation/pages/details/activities/activities_screen.dart';
import 'package:heal_her/features/profile/presentation/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var screens = [
    const HomeScreen(),
    const ActivitiesScreen(),
    const DeviceScreen(),
    const ProfileScreen()
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          enableFeedback: false,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_activity), label: 'Activities'),
            BottomNavigationBarItem(icon: Icon(Icons.watch), label: 'Device'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onTap: _onItemTapped,
        ),
        body: screens[_selectedIndex]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
