import 'package:flutter/material.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/bottom_tile.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/continue_elevated_button.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/onboard_appbar.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/step_indicator.dart';
import 'package:heal_her/presentation/screens/onboarding/view/widgets/top_tile.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';

class ProfileChoice extends StatefulWidget {
  const ProfileChoice({super.key});

  @override
  State<ProfileChoice> createState() => _ProfileChoiceState();
}

class _ProfileChoiceState extends State<ProfileChoice> {
  List data = ["🦊", "😍", "🤠", "👻", "🐹", "💀", "🐼", "🐶", "🦝"];
  int _index = 0;
  Widget _buildListItem(BuildContext context, int index) {
    if (data.length == index) {
      return Container();
    }
    return SizedBox(
      height: 100,
      width: 150,
      child: Column(
        children: [
          Container(
            height: screenHeight(100),
            width: screenWidth(100),
            decoration: BoxDecoration(
                color: _index == index ? const Color(0xff92acfd) : Colors.white,
                borderRadius: BorderRadius.circular(screenHeight(30))),
            child: Center(
              child: Text(
                data[index],
                style: TextStyle(fontSize: screenHeight(35)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: buildOnBoardNavBar(context, 11),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight(60),
          ),
          const StepIndicator(step: 11),
          const TopTile(
            tileContent: "Choose your Profile Image",
          ),
          SizedBox(
            height: screenHeight(10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight(15)),
            child: Icon(
              Icons.arrow_drop_down_rounded,
              size: screenHeight(30),
              color: AppColor.purplyBlue,
            ),
          ),
          SizedBox(
              height: screenHeight(100),
              width: double.infinity,
              child: Center(
                child: ScrollSnapList(
                  itemBuilder: _buildListItem,
                  itemCount: data.length,
                  itemSize: 150,
                  dynamicItemSize: true,
                  onReachEnd: () {
                    // print("end");
                  },
                  initialIndex: 0,
                  onItemFocus: (val) {
                    // print(val.toString());
                    setState(() {
                      _index = val;
                    });
                  },
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight(15)),
            child: Icon(
              Icons.arrow_drop_up_rounded,
              size: screenHeight(30),
              color: AppColor.purplyBlue,
            ),
          ),
          const BottomTile(
            tileContent:
                "Choose your emoji to represnt yourself in the application",
          ),
          SizedBox(
            height: screenHeight(35),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Add Custom Photo",
              style: TextStyle(
                  color: AppColor.purplyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight(18)),
            ),
          ),
          SizedBox(
            height: screenHeight(20),
          ),
          const ContinueElevatedButton()
        ],
      ),
    );
  }
}
