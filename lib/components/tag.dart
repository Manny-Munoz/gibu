import 'package:flutter/material.dart';

class Tag extends StatelessWidget{
final String text;
  final Color textColor;
  final Color buttonColor;
  final double tagWidth;
  final double tagHeight;

  const Tag ({super.key, this.text = "Medical", this.tagHeight=35, this.tagWidth=85, this.textColor = Colors.white, this.buttonColor = const Color.fromARGB(255, 23, 77, 77)});

@override
Widget build(BuildContext context){
  return Container(
    width: tagWidth,
      height: tagHeight,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color:  textColor,
            fontSize: 11,
          ),
        ),
      ),
    );
}}