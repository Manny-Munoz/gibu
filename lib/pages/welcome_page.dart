import "package:flutter/material.dart";
import "package:gibu/components/text_alignment_left.dart";
import "package:gibu/components/button.dart";
import 'package:flutter/services.dart';

class WelcomePage extends StatefulWidget {
  final VoidCallback onLoginTap;
  final VoidCallback onRegisterTap;

  const WelcomePage(
      {super.key, required this.onLoginTap, required this.onRegisterTap});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 170, 129),
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: [
          Image.asset("lib/images/Welcome logo.png"),
          const TextAlignmentLeft(text: "Gibu What you want"),
          const TextAlignmentLeft(text: "Gibu What you can"),
          const TextAlignmentLeft(
              text: "Together we can change our society", textSize: 15),
          const SizedBox(height: 30),
          Button(
            text: "Create Account",
            buttonColor: Colors.white,
            textColor: const Color.fromARGB(255, 23, 77, 77),
            onTap: widget.onRegisterTap,
          ),
          const SizedBox(height: 20),
          Button(onTap: widget.onLoginTap),
          const SizedBox(height: 20),
        ])),
      ),
    );
  }
}
