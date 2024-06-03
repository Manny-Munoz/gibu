import 'package:flutter/material.dart';
import 'package:gibu/components/button.dart';

List<bool> ischecked = [true, false, false];

class StartCampaignPage extends StatefulWidget {
  const StartCampaignPage({super.key});

  @override
  State<StartCampaignPage> createState() => _StartCampaignPageState();
}

class _StartCampaignPageState extends State<StartCampaignPage> {
  String selection = "Medical";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("lib/images/logo isotipo.png"),
            ),
          ],
        ),
        body: Container(
            color: Colors.white,
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Center(
                        child: Column(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Choose the type of campaign you want to create",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ischecked[0] = true;
                          ischecked[1] = false;
                          ischecked[2] = false;
                          selection = "Medical";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ischecked[0]
                              ? const Color.fromARGB(255, 23, 77, 77)
                              : const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromARGB(255, 216, 218, 220),
                            width: 1,
                          ),
                        ),
                        height: 80,
                        // width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Medical',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ischecked[0]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: ischecked[0]
                                      ? const Color.fromARGB(255, 23, 77, 77)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: ischecked[0]
                                        ? Colors.white
                                        : Colors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ischecked[1] = true;
                          ischecked[0] = false;
                          ischecked[2] = false;

                          selection = "Educational";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ischecked[1]
                              ? const Color.fromARGB(255, 23, 77, 77)
                              : const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromARGB(255, 216, 218, 220),
                            width: 1,
                          ),
                        ),
                        height: 80,
                        // width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Educational',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ischecked[1]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: ischecked[1]
                                      ? const Color.fromARGB(255, 23, 77, 77)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: ischecked[1]
                                        ? Colors.white
                                        : Colors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ischecked[0] = false;
                          ischecked[2] = true;
                          ischecked[1] = false;

                          selection = "Non-Profit";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ischecked[2]
                              ? const Color.fromARGB(255, 23, 77, 77)
                              : const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromARGB(255, 216, 218, 220),
                            width: 1,
                          ),
                        ),
                        height: 80,
                        // width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Non-Profit',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ischecked[2]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: ischecked[2]
                                      ? const Color.fromARGB(255, 23, 77, 77)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: ischecked[2]
                                        ? Colors.white
                                        : Colors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 200),
              Button(
                text: "Step 1/2",
                onTap: () => Navigator.pushNamed(context, "/fillOutCampaign",
                    arguments: selection),
              ),
              const SizedBox(height: 20),
            ]))))));
  }
}
