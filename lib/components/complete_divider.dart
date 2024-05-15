import 'package:flutter/material.dart';

class CompleteDivider extends StatelessWidget {
  final double startSpace;
  final double endSpace;
  const CompleteDivider({super.key, this.startSpace = 40, this.endSpace = 40});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Divider(
          thickness: 1,
          color: Colors.black,
          indent: startSpace,
          endIndent: endSpace,
        )
      ]),
    );
  }
}