import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/dob/dob_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/dob/image_holder.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import '../../../../common/screen_utils/screen_size.dart';

class DateOfBirth extends StatefulWidget {
  const DateOfBirth({super.key});

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StepIndicator(step: 1),
            const TopTile(tileContent: "What is your Date of Birth ?"),
            const ImageHolder(),
            SizedBox(height: screenHeight(30)),
            const BottomTile(
              tileContent:
                  "To give personalised food diet plans. Please share your Date of Birth",
            ),
            const DobSelector(),
            SizedBox(height: screenHeight(30)),
            const ContinueElevatedButton(),
          ],
        ),
      ),
    );
  }
}
