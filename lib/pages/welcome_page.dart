import "package:flutter/material.dart";
import "package:gibu/components/text_alignment_left.dart";
import "package:gibu/components/button.dart";

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
              onTap: () => Navigator.pushNamed(context, '/createAccountPage')),
          const SizedBox(height: 20),
          Button(onTap: () => Navigator.pushNamed(context, '/login')),
          const SizedBox(height: 20),
        ])),
      ),
    );
  }
}
