import 'package:flutter/material.dart';
import 'package:gibu/components/campaing_structure.dart';

class PublicCampaing extends StatelessWidget {
  PublicCampaing({super.key});

  @override
  Widget build(BuildContext context) {
    return const CampaingStructure(
      campaingTitle:
          "Bring Lauren home: Fund for Med-Flight & recovery hello how are",
      imagePath: "lib/images/Lauren.png",
      heroPath: "lib/images/profile.png",
      fundraiserName: "Monika Islam",
      raised: "131,234.00",
      goal: "250,000.00",
      raisedPercentage: "100",
      description:
          "Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Lauren Rauseo, a vibrant and compassionate young woman with dreams as wide as the ocean, met with a tragic cycling accident while studying abroad. This accident has left her in a critical condition, fighting for her life far from home.\nLauren has sustained severe injuries, including a traumatic brain injury along with numerous fractures, necessitating multiple surgeries and intensive care. Currently, she is in a medically induced coma, a step taken by her medial team with the hope of stabilizing her condition enough to bring her back to the United States. The goal is to transfer her to a specialized pediatric ICU trauma unit in Boston, where she can receive the best possible care and embark on the long road to recovery.",
    );
  }
}