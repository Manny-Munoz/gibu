import 'package:flutter/material.dart';
import 'package:gibu/components/complete_divider.dart';
import 'package:gibu/components/switch_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
              child: Column(children: [
            const SizedBox(height: 20),
            const Text("Settings", style: TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 50),
                const Text("Edit Profile", style: TextStyle(fontSize: 20)),
                const SizedBox(width: 150),
                Image.asset("lib/images/angle brackets.png"),
                const SizedBox(height: 10),
              ],
            ),
            const CompleteDivider(),
            Row(
              children: [
                const SizedBox(width: 50),
                const Text("Change password", style: TextStyle(fontSize: 20)),
                const SizedBox(width: 78),
                Image.asset("lib/images/angle brackets.png"),
                const SizedBox(height: 10),
              ],
            ),
            const CompleteDivider(),
            Row(
              children: [
                const SizedBox(width: 50),
                const Text("Change language", style: TextStyle(fontSize: 20)),
                const SizedBox(width: 78),
                Image.asset("lib/images/angle brackets.png"),
              ],
            ),
            const CompleteDivider(),
            const SizedBox(height: 20),
            Container(
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 182, 182, 182), width: 1),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 23.0, vertical: 10.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Receive notifications",
                            style: TextStyle(
                                color: Color.fromARGB(255, 146, 144, 144),
                                fontSize: 18),
                          ),
                          SizedBox(width: 50),
                          SwitchButton(),
                        ],
                      ),
                      const CompleteDivider(
                        startSpace: 0,
                        endSpace: 0,
                      ),
                      const Row(children: [
                        Text(
                          "Receive updates",
                          style: TextStyle(
                              color: Color.fromARGB(255, 146, 144, 144),
                              fontSize: 18),
                        ),
                        SizedBox(width: 80),
                        SwitchButton(),
                      ]),
                      const CompleteDivider(
                        startSpace: 0,
                        endSpace: 0,
                      ),
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
                            "Facabook",
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
        ));
  }
}
