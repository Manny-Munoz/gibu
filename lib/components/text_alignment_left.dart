import "package:flutter/material.dart";

class TextAlignmentLeft extends StatelessWidget {
  final String text;
  final double textSize;
  const TextAlignmentLeft({super.key, required this.text, this.textSize = 25});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text, style: TextStyle(fontSize: textSize, color: Colors.white)),
        ],
      ),
    );
  }
}
