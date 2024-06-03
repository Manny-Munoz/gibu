import 'package:flutter/material.dart';
import 'package:gibu/components/double_to_currency.dart';
import 'package:gibu/components/tag.dart';
import 'package:gibu/components/progress_bar.dart';
import 'package:gibu/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CampaingStructure extends StatefulWidget {
  final String campaingTitle;
  final String imagePath;
  final String heroPath;
  final String fundraiserName;
  final double raised;
  final double goal;
  final String description;
  final String campaignId;
  final List<String> likes;
  final String type;

  const CampaingStructure({
    super.key,
    required this.campaingTitle,
    required this.imagePath,
    required this.heroPath,
    required this.fundraiserName,
    required this.raised,
    required this.goal,
    required this.description,
    required this.likes,
    required this.campaignId,
    required this.type,
  });

  @override
  State<CampaingStructure> createState() => _CampaingStructureState();
}

class _CampaingStructureState extends State<CampaingStructure> {
  bool isLiked = false;

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 236, 236),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Container(
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;

                              DocumentReference campaign = FirebaseFirestore
                                  .instance
                                  .collection("campaigns")
                                  .doc(widget.campaignId);

                              if (isLiked) {
                                campaign.update({
                                  'likes':
                                      FieldValue.arrayUnion([currentUser!.uid])
                                });
                              } else {
                                campaign.update({
                                  'likes':
                                      FieldValue.arrayRemove([currentUser!.uid])
                                });
                              }
                            });
                          },
                          child: Image.asset(isLiked
                              ? "lib/images/heart-circle-favorite.png"
                              : "lib/images/heart-circle.png"),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Image.network(widget.imagePath),
                const SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: Text("2 people just donated")),
                      Tag(text: widget.type)
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
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text("Goal: ${doubleToCurrency(widget.goal)}",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Fundraiser",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
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
                    '/donationForm',
                    arguments: {
                      'campaignTitle': widget.campaingTitle,
                      'fundraiserName': widget.fundraiserName,
                      'heroPath': widget.imagePath,
                      "campaignId": widget.campaignId,
                      "raised": widget.raised
                    },
                  ),
                ),
              ])))),
        ));
  }
}
