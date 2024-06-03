import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:gibu/components/campaing_structure.dart";
import 'package:gibu/components/progress_bar.dart';
import 'package:gibu/components/double_to_currency.dart';
import "package:firebase_auth/firebase_auth.dart";

class CampaignPreview extends StatefulWidget {
  final String campaingTitlePreview;
  final String imagePathPreview;
  final String heroPathPreview;
  final String fundraiserNamePreview;
  final double raisedPreview;
  final double goalPreview;
  final String descriptionPreview;
  final String campaignId;
  final List<String> likes;
  final String type;

  const CampaignPreview(
      {super.key,
      required this.campaingTitlePreview,
      required this.imagePathPreview,
      required this.heroPathPreview,
      required this.fundraiserNamePreview,
      required this.raisedPreview,
      required this.goalPreview,
      required this.descriptionPreview,
      required this.likes,
      required this.type,
      required this.campaignId});

  @override
  State<CampaignPreview> createState() => _CampaignPreviewState();
}

class _CampaignPreviewState extends State<CampaignPreview> {
  final currentUser = FirebaseAuth.instance.currentUser;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser!.uid);
  }

  Widget textShortener() {
    String text = (widget.descriptionPreview.length >= 100)
        ? widget.descriptionPreview.substring(0, 100)
        : widget.descriptionPreview;
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: text),
          const TextSpan(
              text: ' read more...',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CampaingStructure(
                      campaingTitle: widget.campaingTitlePreview,
                      imagePath: widget.imagePathPreview,
                      heroPath: widget.heroPathPreview,
                      fundraiserName: widget.fundraiserNamePreview,
                      raised: widget.raisedPreview,
                      goal: widget.goalPreview,
                      description: widget.descriptionPreview,
                      likes: widget.likes,
                      campaignId: widget.campaignId,
                      type: widget.type,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Add border radius here
          color: const Color.fromARGB(223, 235, 233, 233),
        ),
        child: Column(
          children: [
            Row(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image.network(
                    widget.imagePathPreview,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.campaingTitlePreview,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isLiked = !isLiked;

                                    DocumentReference campaign =
                                        FirebaseFirestore.instance
                                            .collection("campaigns")
                                            .doc(widget.campaignId);

                                    if (isLiked) {
                                      campaign.update({
                                        'likes': FieldValue.arrayUnion(
                                            [currentUser!.uid])
                                      });
                                    } else {
                                      campaign.update({
                                        'likes': FieldValue.arrayRemove(
                                            [currentUser!.uid])
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
                      const SizedBox(height: 5),
                      Column(
                        children: [
                          ProgressBar(
                              goal: widget.goalPreview,
                              raised: widget.raisedPreview),
                          const SizedBox(height: 8),
                          Row(children: [
                            Flexible(
                              child: Text(
                                "Raised: ${doubleToCurrency(widget.raisedPreview)} of ${doubleToCurrency(widget.goalPreview)} goal",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ])
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
            textShortener(),
          ],
        ),
      ),
    );
  }
}
