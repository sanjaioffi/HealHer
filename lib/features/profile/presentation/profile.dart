import 'package:flutter/material.dart';
import 'package:heal_her/config/theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColor.heavyPurplyBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/png/happy.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sanjai P',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'sanjaiofficial@gmail.com',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 3,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'WEIGHT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 2),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                  text: const TextSpan(
                                      text: '50',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      children: [
                                    TextSpan(
                                      text: ' kg',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )
                                  ])),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              width: 50,
                            ),
                          ),
                          Column(
                            children: [
                              const Text(
                                'AGE',
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 2,
                                    fontSize: 15),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                  text: const TextSpan(
                                      text: '19',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      children: [
                                    TextSpan(
                                      text: ' yrs',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )
                                  ])),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              width: 50,
                            ),
                          ),
                          Column(
                            children: [
                              const Text(
                                'HEIGHT',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                  text: const TextSpan(
                                      text: '159',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      children: [
                                    TextSpan(
                                      text: ' cm',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )
                                  ])),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: Text(
              'Personal Information',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.golf_course_sharp,
              color: Colors.black,
            ),
            title: Text(
              'Goal Set-up',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.language,
              color: Colors.black,
            ),
            title: Text(
              'Language',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.privacy_tip,
              color: Colors.black,
            ),
            title: Text(
              'Privacy Policy',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.black,
            ),
            title: Text(
              'Help',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class DataTile extends StatelessWidget {
  DataTile({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.body,
  });

  Color backgroundColor;
  String title;
  Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              const Icon(
                Icons.directions_walk_rounded,
                color: AppColor.stepsIndicator,
                size: 30,
              ),
            ],
          ),
          const SizedBox(height: 20),
          body,
        ],
      ),
    );
  }
}
