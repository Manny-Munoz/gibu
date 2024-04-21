import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final Color borderColor;
  const ImageCard({
    super.key,
    required this.imagePath,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Image.asset(
        imagePath,
        height: 25,
        width: 60,
      ),
    );
  }
}