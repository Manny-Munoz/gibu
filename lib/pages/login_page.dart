import "package:flutter/material.dart";
import "package:gibu/components/divider.dart";
import "package:gibu/components/input_text.dart";
import "package:gibu/components/social_media_button.dart";
import "package:gibu/components/text_alignment_left.dart";
import "package:gibu/components/button.dart";
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
                obscureText: false),
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
              onTap: () => Navigator.pushNamed(context, '/main'),
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
                    onTap: () =>
                        Navigator.pushNamed(context, "/createAccountPage"),
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
