import 'package:flutter/material.dart';
import "package:gibu/components/campaing_structure.dart";
import 'package:gibu/components/progress_bar.dart';
import 'package:gibu/components/double_to_currency.dart';

class CampaignPreview extends StatelessWidget {
  final String campaingTitlePreview;
  final String imagePathPreview;
  final String heroPathPreview;
  final String fundraiserNamePreview;
  final double raisedPreview;
  final double goalPreview;
  final String descriptionPreview;

  const CampaignPreview({
    super.key,
    required this.campaingTitlePreview,
    required this.imagePathPreview,
    required this.heroPathPreview,
    required this.fundraiserNamePreview,
    required this.raisedPreview,
    required this.goalPreview,
    required this.descriptionPreview,
  });

  Widget textShortener() {
    String text = (descriptionPreview.length >= 100)
        ? descriptionPreview.substring(0, 100)
        : descriptionPreview;
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
                      campaingTitle: campaingTitlePreview,
                      imagePath: imagePathPreview,
                      heroPath: heroPathPreview,
                      fundraiserName: fundraiserNamePreview,
                      raised: raisedPreview,
                      goal: goalPreview,
                      description: descriptionPreview,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding: const EdgeInsets.only(left:10, right:10, top:15, bottom:15),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0), // Add border radius here
        color: const Color.fromARGB(255, 240, 236, 236),
  ),
        child: Column(
          children: [
            Row(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset(
                    "lib/images/Lauren.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        campaingTitlePreview,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Column(
                        children: [
                          ProgressBar(goal: goalPreview, raised: raisedPreview),
                          const SizedBox(height: 8),
                          Row(children: [
                            Flexible(
                              child: Text(
                                "Raised: ${doubleToCurrency(raisedPreview)} of ${doubleToCurrency(goalPreview)} goal", style: const TextStyle(fontWeight: FontWeight.bold),
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
