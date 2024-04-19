import "package:flutter/material.dart";

class TextAlignmentLeft extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  const TextAlignmentLeft({super.key, required this.text, this.textSize = 22, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text, style: TextStyle(fontSize: textSize, color: textColor)),
        ],
      ),
    );
  }
}
