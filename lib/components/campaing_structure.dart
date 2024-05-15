import 'package:flutter/material.dart';
import 'package:gibu/components/tag.dart';
import 'package:gibu/components/progress_bar.dart';

class CampaingStructure extends StatelessWidget {
  final String campaingTitle;
  final String imagePath;
  final String heroPath;
  final String fundraiserName;
  final double raised;
  final double goal;
  final String description;
  const CampaingStructure({
    super.key,
    required this.campaingTitle,
    required this.imagePath,
    required this.heroPath,
    required this.fundraiserName,
    required this.raised,
    required this.goal,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: const Color.fromARGB(255, 240, 236, 236),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Image.asset("lib/images/favorite.png"),
                ]),
              ),
              const SizedBox(height: 7),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    campaingTitle,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  )),
              const SizedBox(height: 10),
              Image.asset(imagePath),
              const SizedBox(height: 8),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 3),
                            Image.asset(heroPath),
                            const SizedBox(width: 8),
                             Text(
                                    "$fundraiserName is organizing this fundraiser",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Color.fromARGB(255, 104, 104, 104))),
                          ],
                        ),
                        const Tag() 
                      ])),
              const SizedBox(height: 8),
              ProgressBar(goal: goal, raised: raised),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Raised: $raised of $goal goal",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 182, 182, 182),
                      width: 1),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 23.0, vertical: 10.0),
                  child: Text(
                    "$description ",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 104, 104, 104),
                        fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ])))));
  }
}
