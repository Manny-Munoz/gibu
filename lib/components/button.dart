import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;

  const Button({super.key, this.text = "Login", this.textColor = const Color.fromARGB(255, 230, 245, 196), this.buttonColor = const Color.fromARGB(255, 23, 77, 77)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 75,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color:  textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
