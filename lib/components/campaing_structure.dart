import 'package:flutter/material.dart';
import 'package:gibu/components/double_to_currency.dart';
import 'package:gibu/components/tag.dart';
import 'package:gibu/components/progress_bar.dart';
import 'package:gibu/components/button.dart';

class CampaingStructure extends StatefulWidget {
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
  State<CampaingStructure> createState() => _CampaingStructureState();
}

class _CampaingStructureState extends State<CampaingStructure> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 236, 236),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: const Color.fromARGB(255, 240, 236, 236),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.campaingTitle,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                        child: Image.asset(_isFavorite
                            ? "lib/images/heart-circle.png"
                            : "lib/images/heart-circle-favorite.png"),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Image.asset(widget.imagePath),
              const SizedBox(height: 8),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text("2 people just donated")),
                    Tag()
                  ]),
              const SizedBox(height: 8),
              Column(
                children: [
                  ProgressBar(goal: widget.goal, raised: widget.raised),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Raised: ${doubleToCurrency(widget.raised)}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text("Goal: ${doubleToCurrency(widget.goal)}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Fundraiser",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Image.asset(widget.heroPath),
                      const SizedBox(width: 8),
                      Text(widget.fundraiserName,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 104, 104, 104))),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
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
                    "${widget.description} ",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 104, 104, 104),
                        fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Button(
                text: "Donate Now",
                buttonWidth: double.infinity,
                buttonHeight: 50,
                onTap: () => Navigator.pushNamed(
                  context,
                  '/main',
                ),
              ),
            ])))));
  }
}
