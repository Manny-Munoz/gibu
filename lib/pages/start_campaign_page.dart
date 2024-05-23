import 'package:flutter/material.dart';
import 'package:gibu/components/radio_button.dart';
import 'package:gibu/components/button.dart';

class StartCampaignPage extends StatelessWidget {
  const StartCampaignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            color: Colors.white,
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Center(
                        child: Column(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("lib/images/logo isotipo.png"),
                    ],
                  )),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Choose the type of campaign you want to create",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 30,
              ),
              const MyRadioButton(),
              const SizedBox(height: 200),
              Button(
                text: "Step 1/2",
                onTap: () => Navigator.pushNamed(context, "/fillOutCampaign"),
              ),
              const SizedBox(height: 20),
            ]))))));
  }
}
