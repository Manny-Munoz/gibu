import 'package:flutter/material.dart';
import 'package:gibu/components/input_text.dart';
import 'package:gibu/components/tag.dart';

class StepTwoCampaing extends StatelessWidget {
  StepTwoCampaing({super.key});
  final beneficiaryController = TextEditingController();
  final contactController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

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
              const SizedBox(height: 50),
              InputText(
                  controller: beneficiaryController,
                  hintText: "Beneficiary name",
                  obscureText: false),
              const SizedBox(height: 10),
              InputText(
                  controller: contactController,
                  hintText: "Contact number",
                  obscureText: false),
              const SizedBox(height: 10),
              InputText(
                  controller: ageController, hintText: "Age", obscureText: false),
              const SizedBox(height: 10),
              InputText(
                  controller: addressController,
                  hintText: "Home address",
                  obscureText: false),
              const SizedBox(height: 10),
              InputText(
                  controller: descriptionController,
                  hintText: "Description",
                  obscureText: false,
                  max: 5,
                  min: 5),
              const SizedBox(height: 10),
              const Tag(text: "Cover image", tagWidth: 140, tagHeight: 45, textSize: 15,),
              const SizedBox(height: 10),
              const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: Text(
                      "Submit medical records or any type of documentation in support of your campaign.",
                      style: TextStyle(
                        height: 1.2,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ),
              const SizedBox(height: 10),
              const Tag(text: "Choose file", tagWidth: 140, tagHeight: 45, textSize: 15,),
              const SizedBox(height: 20),
              const Tag(text: "Submit", tagWidth: 350, tagHeight: 55, textSize: 20,),
              const SizedBox(height: 10),
                ]),
                    ),
            )
        ),
      ));
  }
}
