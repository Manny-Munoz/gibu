import 'package:flutter/material.dart';
import 'package:gibu/components/radio_button.dart';
import 'package:gibu/components/tag.dart';

class ChooseCampaignType extends StatelessWidget{
  const ChooseCampaignType({super.key});

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
                  child: Column(
                      children: [
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
                child: Text("Choose the type of campaign you want to create", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 30,),
              MyRadioButton(),
              const SizedBox(height: 200),
              const Tag(text: "Step 1/2", tagWidth: 350, tagHeight: 55, textSize: 20,),
              const SizedBox(height: 20),
                      ]))))));}}