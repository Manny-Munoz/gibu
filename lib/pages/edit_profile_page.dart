import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  String imageUrl = "";

  Future getImage(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file == null) return;

    String? uniqueName = FirebaseAuth.instance.currentUser?.uid;

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("profile pictures");
    if (uniqueName != null) {
      Reference referenceImageToUpload = referenceDirImages.child(uniqueName);
      try {
        await referenceImageToUpload.putFile(File(file.path));
        imageUrl = await referenceImageToUpload.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update({"profile picture": imageUrl});
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Ooops!! something went wrong")));
      }
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Ooops!! something went wrong")));
    }
  }

  Future<void> editField(String field) async {
    String newValue = '';
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title:
              Text("Edit $field", style: const TextStyle(color: Colors.black)),
          backgroundColor: Colors.grey[200],
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.black),
            onChanged: (value) => newValue = value,
            decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(140, 23, 77, 77)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(140, 23, 77, 77)),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  const Text("Cancel", style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              child: const Text("Save", style: TextStyle(color: Colors.black)),
              onPressed: () => Navigator.of(context).pop(newValue),
            )
          ]),
    );

    if (newValue.isNotEmpty) {
      // Update the email in the Firestore database
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({field: newValue});

      // Update the email in the Firebase authentication system
      if (field == 'email') {
        await FirebaseAuth.instance.currentUser
            ?.verifyBeforeUpdateEmail(newValue);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: userData['profile picture'] != ""
                        ? NetworkImage(userData['profile picture'])
                        : null,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      color: const Color.fromARGB(136, 158, 158, 158),
                      onPressed: () => getImage(context),
                    ),
                  ),
                  TextBox(
                    onPressed: () => editField('username'),
                    sectionName: userData['username'],
                    text: 'username',
                  ),
                  TextBox(
                    onPressed: () => editField('email'),
                    sectionName: userData['email'],
                    text: 'email',
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

class TextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;

  const TextBox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(text,
                    style: const TextStyle(fontWeight: FontWeight.bold))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sectionName),
                IconButton(onPressed: onPressed, icon: const Icon(Icons.edit))
              ],
            ),
          ],
        ));
  }
}
