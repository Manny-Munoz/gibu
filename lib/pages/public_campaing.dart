import 'package:flutter/material.dart';
import "package:gibu/components/campaign_preview.dart";

class PublicCampaing extends StatelessWidget {
  const PublicCampaing({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CampaignPreview(
          campaingTitlePreview:
              "Bring Lauren home: Fund for Med-Flight & recovery hello how are",
          imagePathPreview: "lib/images/Lauren.png",
          heroPathPreview: "lib/images/profile.png",
          fundraiserNamePreview: "Monika Islam",
          raisedPreview: 5000.00,
          goalPreview: 250000.00,
          descriptionPreview:
              "Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me.",
        ),
        CampaignPreview(
          campaingTitlePreview:
              "Bring Lauren home: Fund for Med-Flight & recovery hello how are",
          imagePathPreview: "lib/images/Lauren.png",
          heroPathPreview: "lib/images/profile.png",
          fundraiserNamePreview: "Monika Islam",
          raisedPreview: 5000.00,
          goalPreview: 250000.00,
          descriptionPreview:
              "Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me.",
        ),
      ],
    );
  }
}
