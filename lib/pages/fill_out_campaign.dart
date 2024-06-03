import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gibu/components/input_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gibu/components/button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";

class FillOutCampaign extends StatefulWidget {
  const FillOutCampaign({super.key});

  @override
  State<FillOutCampaign> createState() => _FillOutCampaignState();
}

class _FillOutCampaignState extends State<FillOutCampaign> {
  final beneficiaryController = TextEditingController();
  final contactController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  final goalController = TextEditingController();
  final titleController = TextEditingController();
  String imageUrl = "";

  addImage(context) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file == null) return;

    String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("images");
    Reference referenceImageToUpload = referenceDirImages.child(uniqueName);

    try {
      await referenceImageToUpload.putFile(File(file.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Ooops!! something went wrong")));
    }
  }

  createCampaign(BuildContext context, typeOfCampaign) async {
    await FirebaseFirestore.instance.collection('campaigns').add({
      'fundraiser': FirebaseAuth.instance.currentUser?.uid,
      'goal': double.parse(goalController.text),
      'hero': "lib/images/profile.png",
      'image': imageUrl,
      'likes': [],
      'raised': 0,
      'title': titleController.text,
      'beneficiary name': beneficiaryController.text,
      'contact number': contactController.text,
      'age': int.parse(ageController.text),
      'address': addressController.text,
      'description': descriptionController.text,
      'type': typeOfCampaign,
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'campaigns': FieldValue.arrayUnion([titleController.text]),
    });

    if (context.mounted) {
      await Navigator.pushNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    final typeOfCampaign = (ModalRoute.of(context)?.settings.arguments ?? "");

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
                InputText(
                    controller: titleController,
                    hintText: "Campaign Title",
                    obscureText: false),
                const SizedBox(height: 10),
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
                    controller: ageController,
                    hintText: "Age",
                    obscureText: false),
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

                InputText(
                    controller: goalController,
                    hintText: "Goal Amount",
                    obscureText: false),
                const SizedBox(height: 10),

                // const Tag(
                //   text: "Cover image",
                //   tagWidth: 140,
                //   tagHeight: 45,
                //   textSize: 15,
                // ),
                const SizedBox(height: 10),
                Button(
                  onTap: () => addImage(context),
                  text: "Cover image for your campaign",
                  buttonColor: Colors.black,
                ),
                const SizedBox(height: 10),
                // const Padding(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                //   child: Text(
                //     "Submit medical records or any type of documentation in support of your campaign.",
                //     style: TextStyle(
                //         height: 1.2, color: Colors.black, fontSize: 18),
                //   ),
                // ),
                // const SizedBox(height: 10),
                // const Tag(
                //   text: "Choose file",
                //   tagWidth: 140,
                //   tagHeight: 45,
                //   textSize: 15,
                // ),
                // const SizedBox(height: 20),
                const SizedBox(height: 10),
                Button(
                  textColor: Colors.white,
                  onTap: () => createCampaign(context, typeOfCampaign),
                  text: "Submit campaign",
                ),
                const SizedBox(height: 10),
              ]),
            ),
          )),
        ));
  }
}
