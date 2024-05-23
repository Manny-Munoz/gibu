import "package:flutter/material.dart";
import "package:gibu/components/divider.dart";
import "package:gibu/components/input_text.dart";
import "package:gibu/components/social_media_button.dart";
import "package:gibu/components/text_alignment_left.dart";
import "package:gibu/components/button.dart";
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void logUserIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      displayMessage(e.code);
    } finally {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  void displayMessage(final String message) {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(message)),
      );
    }
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
          child: Column(children: [
            const SizedBox(height: 25),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("lib/images/logo isotipo.png"),
                  ],
                )),
            const SizedBox(height: 30),
            const TextAlignmentLeft(text: "Log in", textSize: 32),
            const SizedBox(height: 15),
            const TextAlignmentLeft(text: "Email address"),
            const SizedBox(height: 9),
            InputText(
                controller: emailController,
                hintText: "Your email",
                obscureText: false),
            const SizedBox(height: 15),
            const TextAlignmentLeft(text: "Password"),
            const SizedBox(height: 9),
            InputText(
                controller: passwordController,
                hintText: "Your password",
                obscureText: true),
            const SizedBox(height: 9),
            const TextAlignmentLeft(
              text: "Forgot your password?",
              textSize: 18,
              textColor: Color.fromARGB(255, 37, 36, 39),
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              onTap: () => logUserIn(),
            ),
            const SizedBox(height: 40),
            const TextDivider(),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageCard(imagePath: "lib/images/facebook.png"),
                SizedBox(width: 20),
                ImageCard(imagePath: "lib/images/google.png"),
                SizedBox(width: 20),
                ImageCard(imagePath: "lib/images/apple.png")
              ],
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ]),
        ),
      )),
    );
  }
}
