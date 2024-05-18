import 'package:flutter/material.dart';

class CompleteDivider extends StatelessWidget {
  const CompleteDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: const Divider(
        color: Colors.black,
        thickness: 1,
        height: 1,
      ),
    );
  }
}
