import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  const ImageCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Image.asset(
        imagePath,
        height: 25,
        width: 60,
      ),
    );
  }
}