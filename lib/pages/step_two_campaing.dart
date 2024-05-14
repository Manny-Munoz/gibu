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
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
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
          const Tag(text: "Cover image", tagWidth: 120, tagHeight: 40),
  ]),
      )));
  }
}
