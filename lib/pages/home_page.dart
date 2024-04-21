import "package:flutter/material.dart";
import "package:gibu/components/input_text.dart";
import "package:gibu/components/text_alignment_left.dart";
import "package:gibu/components/social_media_button.dart";

class HomePage extends StatelessWidget {
  final name = "Monika";
  final controller = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextAlignmentLeft(
                text: "Hello, $name 👋",
              ),
              const SizedBox(height: 5),
              const TextAlignmentLeft(
                text: "What do you wanna donate today? 🤔",
                textSize: 12,
              ),
              const SizedBox(height: 20),
              InputText(
                  controller: controller,
                  hintText: "🔎 Search here",
                  obscureText: false),
              const SizedBox(height: 15),
              const TextAlignmentLeft(
                text: "Categories",
              ),
              const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ImageCard(imagePath: "lib/images/medical.png", backgroundColor: Color.fromARGB(155, 52, 145, 230), borderColor: Color.fromARGB(255, 52, 145, 230),),
                    SizedBox(height: 5),
                    Text("Medical",
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    ImageCard(imagePath: "lib/images/educational.png", backgroundColor: Color.fromARGB(155, 37, 158, 164), borderColor: Color.fromARGB(255, 37, 158, 164),),
                    SizedBox(height: 5),
                    Text("Educational",
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    ImageCard(imagePath: "lib/images/non-profit.png", backgroundColor: Color.fromARGB(155, 255, 153, 0), borderColor: Color.fromARGB(255, 255, 153, 0),),
                    SizedBox(height: 5),
                    Text("Non-profit",
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
