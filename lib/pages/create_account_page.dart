import "package:flutter/material.dart";
import 'package:gibu/components/input_text.dart';
import 'package:gibu/components/text_alignment_left.dart';
import 'package:gibu/components/button.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailConstroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
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
                    controller: emailConstroller,
                    hintText: "Your name",
                    obscureText: false),
                const SizedBox(height: 15),
                const TextAlignmentLeft(text: "Password"),
                const SizedBox(height: 9),
                InputText(
                    controller: passwordController,
                    hintText: "your password",
                    obscureText: false),
                const SizedBox(height: 15),
                const TextAlignmentLeft(
                    text: "I accept the terms and privacy policy",
                    textSize: 15),
                const SizedBox(height: 60),
                Button(onTap: () => Navigator.pushNamed(context, '/')),
                const SizedBox(height: 70),
                Row(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      child: const Text(
                        "Log in",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
