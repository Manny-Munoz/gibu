import "package:flutter/material.dart";
import 'package:gibu/components/logout_button.dart';
import 'package:gibu/components/profile_component.dart';
import "package:gibu/components/complete_divider.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:gibu/components/rate_app.dart';
import 'package:gibu/components/campaign_list.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> _launchUrl(String imagePath) async {
    final Uri uri = Uri(scheme: 'https', host: imagePath);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        body: Container(
            color: Colors.white,
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const ProfileStrcture(
                    imageProfile: "lib/images/profile (2).png",
                    username: "Monika Islam",
                    email: "monikaislam123@gmail.com"),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 40),
                    Image.asset("lib/images/share.png"),
                    const SizedBox(width: 15),
                    TextButton(
                        onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                  surfaceTintColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Share with friends',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  _launchUrl("mail.google.com");
                                                },
                                                child: Image.asset(
                                                    'lib/images/share_email.png')),
                                            GestureDetector(
                                              onTap: () {
                                                _launchUrl("facebook.com");
                                              },
                                              child: Image.asset(
                                                  'lib/images/share_facebook.png'),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _launchUrl("twitter.com");
                                              },
                                              child: Image.asset(
                                                  'lib/images/share_twitter.png'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _launchUrl("pinterest.com");
                                              },
                                              child: Image.asset(
                                                  'lib/images/share_pinterest.png'),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _launchUrl("linkedin.com");
                                              },
                                              child: Image.asset(
                                                  'lib/images/share_linkedin.png'),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _launchUrl("instagram.com");
                                              },
                                              child: Image.asset(
                                                  'lib/images/share_instagram.png'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 23, 77, 77)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                        child: const Text(
                          "Share with friends",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          selectionColor: Colors.black,
                        )),
                  ],
                ),
                const CompleteDivider(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 40),
                    Image.asset("lib/images/experience.png"),
                    const SizedBox(width: 15),
                    TextButton(
                        onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                  surfaceTintColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(height: 10),
                                        const Text(
                                          "User's experience",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          "Do you like our app? please",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        const Text(
                                          'rate us!',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        const SizedBox(height: 10),
                                        const RateMyApp(),
                                        const SizedBox(height: 10),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Ok',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 23, 77, 77)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                        child: const Text(
                          "User's experience",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          selectionColor: Colors.black,
                        )),
                  ],
                ),
                const CompleteDivider(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 40),
                    Image.asset("lib/images/campaign.png"),
                    const SizedBox(width: 15),
                    TextButton(
                        onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                  surfaceTintColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(height: 10),
                                        const Text(
                                          "My campaigns",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        const CampaignList(
                                            campaingName:
                                                'Bring Lauren Home - Fund for Med-Flight & Recovery'),
                                        const SizedBox(height: 10),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Ok',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 23, 77, 77)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                        child: const Text(
                          "My campaigns",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          selectionColor: Colors.black,
                        )),
                  ],
                ),
                const CompleteDivider(),
                const SizedBox(height: 180),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [        
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: LogoutButton(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            )))));
  }
}