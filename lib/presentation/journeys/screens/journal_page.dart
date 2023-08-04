import 'package:flutter/material.dart';

import '../../common/screen_uits/screen_size.dart';
import '../../library/calender.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      backgroundColor: const Color(0xff8980f0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title:const Text(
          "Journal",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          HorizontalCalendar(
            textColor: Colors.white,
            initialDate: DateTime.utc(2000, 7, 20),
            lastDate: DateTime.utc(2100, 7, 20),
            date: DateTime.now(),
            backgroundColor: Colors.transparent,
            selectedColor: const Color(0xff6f65db),
            dateBackgroundColor: const Color.fromARGB(255, 160, 151, 250),
            onDateSelected: (date) {
              // setState(() {
              //   currentDate = formate;
              // });
            },
          ),
          SizedBox(
            height: screenHeight(20),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(28), vertical: screenHeight(22)),
            decoration: BoxDecoration(
                color: const Color(0xfff4f5fa),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    screenHeight(25),
                  ),
                  topRight: Radius.circular(
                    screenHeight(25),
                  ),
                )),
            height: screenHeight(628.01),

            // Search Bar
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(screenWidth(15)),
                  height: screenHeight(60),
                  // width: screenWidth(450),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  )),
            ]),
          ),
        ]),
      ),
    );
  }
}
