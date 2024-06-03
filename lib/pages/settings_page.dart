import 'package:flutter/material.dart';
import 'package:gibu/components/complete_divider.dart';
import 'package:gibu/components/switch_button.dart';
import 'package:gibu/pages/change_password_page.dart';
import 'package:gibu/pages/edit_profile_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Center(
                  child: Column(children: [
                const SizedBox(height: 20),
                const Text("Settings", style: TextStyle(fontSize: 30)),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const EditProfilePage();
                    }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Edit Profile",
                          style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 78),
                      Image.asset("lib/images/angle brackets.png"),
                    ],
                  ),
                ),
                const CompleteDivider(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChangePassword();
                    }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Change Password",
                          style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 78),
                      Image.asset("lib/images/angle brackets.png"),
                    ],
                  ),
                ),
                const CompleteDivider(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/changeLanguage');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Change language",
                          style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 78),
                      Image.asset("lib/images/angle brackets.png"),
                    ],
                  ),
                ),
                const CompleteDivider(),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 182, 182, 182),
                        width: 1),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23.0, vertical: 10.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Receive notifications",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 146, 144, 144),
                                    fontSize: 18),
                              ),
                              SwitchButton(),
                            ],
                          ),
                          const CompleteDivider(),
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Receive updates",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 146, 144, 144),
                                      fontSize: 18),
                                ),
                                SwitchButton(),
                              ]),
                          const CompleteDivider(),
                          const SizedBox(height: 10),
                          const Text(
                            "COMMUNITY",
                            style: TextStyle(
                                color: Color.fromARGB(255, 146, 144, 144),
                                fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Image.asset("lib/images/minimal_facebook.png"),
                              const SizedBox(width: 20),
                              const Text(
                                "Facebook",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 146, 144, 144),
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Image.asset("lib/images/instagram.png"),
                              const SizedBox(width: 20),
                              const Text("Instagram",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 146, 144, 144),
                                      fontSize: 18)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Image.asset("lib/images/twitter.png"),
                              const SizedBox(width: 20),
                              const Text("Twitter",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 146, 144, 144),
                                      fontSize: 18)),
                            ],
                          ),
                        ],
                      )),
                ),
              ])),
            ),
          ),
        ));
  }
}
