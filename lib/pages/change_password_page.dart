import 'package:flutter/material.dart';
import 'package:gibu/components/button.dart';
import 'package:gibu/components/input_text.dart';
import 'package:gibu/components/text_alignment_left.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final newpasswordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final currentPasswordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

  changePasswordDatabase(BuildContext context) async {
    if (confirmpasswordcontroller.text != newpasswordcontroller.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match")));
      return;
    } else {
      var credential = EmailAuthProvider.credential(
          email: user!.email!, password: currentPasswordController.text);
      await user!.reauthenticateWithCredential(credential).then((value) async {
        await user!.updatePassword(newpasswordcontroller.text).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Password changed successfully")));
          const Duration(seconds: 2);
          FirebaseAuth.instance.signOut();
          Navigator.pushNamed(context, '/auth');
          }).catchError((onError) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Ooops!! something went wrong")));
        });
      }).catchError((onError) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Ooops!! something went wrong")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const SizedBox(height: 25),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("lib/images/logo isotipo.png"),
                    ],
                  )),
              const SizedBox(height: 50),
              const TextAlignmentLeft(
                text: "Change password",
                textSize: 32,
              ),
              const SizedBox(height: 5),
              const TextAlignmentLeft(
                text: "Please type something you'll remember",
                textSize: 14,
                textColor: Color.fromARGB(255, 88, 88, 88),
              ),
              const SizedBox(height: 20),
              const TextAlignmentLeft(text: "Current password"),
              const SizedBox(height: 9),
              InputText(
                  controller: currentPasswordController,
                  hintText: "Must be 8 characters",
                  obscureText: true),
              const TextAlignmentLeft(text: "New password"),
              const SizedBox(height: 9),
              InputText(
                  controller: newpasswordcontroller,
                  hintText: "Must be 8 characters",
                  obscureText: true),
              const SizedBox(height: 15),
              const TextAlignmentLeft(text: "Confirm new password"),
              const SizedBox(height: 9),
              InputText(
                  controller: confirmpasswordcontroller,
                  hintText: "Confirm password",
                  obscureText: true),
              const SizedBox(height: 50),
              Button(
                text: "Change password",
                onTap: () => changePasswordDatabase(context),
              ),
            ],
          )),
        )));
  }
}
