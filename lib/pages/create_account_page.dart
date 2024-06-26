import "package:flutter/material.dart";
import 'package:gibu/components/input_text.dart';
import 'package:gibu/components/text_alignment_left.dart';
import 'package:gibu/components/button.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccountPage extends StatefulWidget {
  final Function()? onTap;

  const CreateAccountPage({super.key, required this.onTap});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isChecked = false;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  signUserIn() async {
    try {
      if (_isChecked != true) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Please accept the terms and privacy policy")));
        return;
      } else {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': usernameController.text,
          'email': emailController.text,
          'language': 'en',
          'campaigns': [],
          'likedCampaigns': [],
          'profile picture': '',
          'contributions': [],
        });
      }
    } on FirebaseAuthException catch (e) {
      displayMessage(e.code);
    }
  }

  void displayMessage(final String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(message)),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                    ),
                  ),
                  const SizedBox(height: 30),
                  const TextAlignmentLeft(
                    text: "Create account",
                    textSize: 32,
                  ),
                  const SizedBox(height: 15),
                  const TextAlignmentLeft(text: "Username"),
                  const SizedBox(height: 9),
                  InputText(
                      controller: usernameController,
                      hintText: "Your username",
                      obscureText: false),
                  const SizedBox(height: 15),
                  const TextAlignmentLeft(text: "Email"),
                  const SizedBox(height: 9),
                  InputText(
                      controller: emailController,
                      hintText: "Your name",
                      obscureText: false),
                  const SizedBox(height: 15),
                  const TextAlignmentLeft(text: "Password"),
                  const SizedBox(height: 9),
                  InputText(
                      controller: passwordController,
                      hintText: "your password",
                      obscureText: true),
                  const SizedBox(height: 15),
                  Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: CheckboxListTile(
                      title: const Text(
                        'I accept the terms and privacy policy',
                      ),
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: const Color.fromARGB(255, 58, 170, 129),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Button(onTap: () => signUserIn()),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
