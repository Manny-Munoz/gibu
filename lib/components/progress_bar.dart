import "package:flutter/material.dart";

class ProgressBar extends StatelessWidget {
  final double goal;
  final double raised;
  const ProgressBar({super.key, required this.goal, required this.raised});

  getPercentage() {
    double percentage = raised * 100 / goal / 100;

    if (percentage > 1) {
      return 1.0;
    }

    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 10.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(50, 23, 77, 77),
          ),
        ),
        FractionallySizedBox(
          widthFactor: getPercentage(),
          child: Container(
            height: 10.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 23, 77, 77),
            ),
          ),
        ),
      ],
    );
  }
}
