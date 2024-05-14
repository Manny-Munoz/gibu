import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final int max;
  final int min;

  const InputText({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.max=1,
    this.min=1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        minLines: min,
        maxLines: max,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}