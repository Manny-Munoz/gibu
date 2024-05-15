import 'package:flutter/material.dart';
import "package:gibu/components/campaing_structure.dart";
import 'package:gibu/components/progress_bar.dart';

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
      child: Row(
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
                ProgressBar(goal: goalPreview, raised: raisedPreview),
                Text(
                  descriptionPreview,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
