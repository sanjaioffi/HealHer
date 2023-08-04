import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../../../../common/screen_utils/screen_size.dart';
import '../../../../utils/app_colors.dart';
import '../widgets/button_style/common_button.dart';

class ProfileChoice extends StatefulWidget {
  const  ProfileChoice({super.key});

  @override
  State<ProfileChoice> createState() => _ProfileChoiceState();
}

class _ProfileChoiceState extends State<ProfileChoice> {
  List data = [
    "🦊",
    "😍",
    "🤠",
    "👻",
    "🐹",
    "💀",
    "🐼",
    "🐶",
    "🦝",
  ];

  int _index = 0;

  Widget _buildListItem(BuildContext context, int index) {
    if (data.length == index) {
      return Container();
    }
    return Container(
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
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("Next",
                  style: TextStyle(
                    fontSize: screenHeight(16),
                    fontWeight: FontWeight.bold,
                    color: AppColor.purplyBlue.withOpacity(.9),
                  ))),
        ],
        centerTitle: true,
        title: Text("profile choice",
            style: TextStyle(
              fontSize: screenHeight(20),
              fontWeight: FontWeight.bold,
              color: AppColor.purplyBlue,
            )),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight(60),
            ),
            Text(
              "STEP 1/7",
              style: TextStyle(
                  color: AppColor.purplyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight(15)),
            ),
            Text(
              "Profile Picture",
              style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight(25)),
            ),
            SizedBox(
              height: screenHeight(35),
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
                      print("end");
                    },
                    initialIndex: 0,
                    onItemFocus: (val) {
                      print(val.toString());
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
            Text(
              "You can select photo from one of\nthis emoji or add your own photo\n as a profile picture",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: screenHeight(14),
                color: AppColor.santaGrey,
              ),
              textAlign: TextAlign.center,
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
                )),
            SizedBox(
              height: screenHeight(50),
            ),
            commonButton(
                function: () {
                   },
                text: "Continue",
                context: context)
          ],
        ),
      ),
    );
  }
}
