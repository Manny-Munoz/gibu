import "package:flutter/material.dart";
import "package:gibu/components/button.dart";

class RequestStatusPage extends StatelessWidget {
  final String imagePath;
  final String text;
  final String title;
  final String path;

  const RequestStatusPage(
      {super.key,
      required this.imagePath,
      required this.text, required this.title,
      this.path = "Home"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath),
              const SizedBox(height: 20),
              Text(title, style: const TextStyle(fontSize: 30)),
              const SizedBox(height: 20),
              Text(text),
              const SizedBox(height: 20),
              Button(text: "Back to $path", textColor: Colors.white, onTap: () => Navigator.pushNamed(context, '/$path'),)
            ],
          ),
        )));
  }
}
