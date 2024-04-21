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






































/* class CampaingOne extends StatelessWidget {
  const CampaingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Color.fromARGB(255, 240, 236, 236),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child:
                        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Image.asset("lib/images/favorite.png"),
                    ]),
                  ),
                  const SizedBox(height: 7),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text("Bring Lauren home: Fund for Med-Flight & recovery hello how are",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                  const SizedBox(height: 10),
                  Image.asset("lib/images/Lauren.png"),
                  const SizedBox(height: 8),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("lib/images/profile.png"),
                                const SizedBox(width: 8),
                            const Text("Monika Islam is organizing this fundraiser", style: TextStyle(fontSize: 9, color: Color.fromARGB(255, 104, 104, 104))),
                            const SizedBox(width: 2),
                              ],
                            ),             
                            const Tag()
                          ])),
                  const SizedBox(height: 8),
                  Image.asset("lib/images/bar.png"),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                                Text("Raised: \$131,234.00 of \$250,000.00",),
                          ],
                        ),
                        Text("100%")
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 350,
                      decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 182, 182, 182), width: 1),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
                        child: Text(
                          'Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Lauren Rauseo, a vibrant and compassionate young woman with dreams as wide as the ocean, met with a tragic cycling accident while studying abroad. This accident has left her in a critical condition, fighting for her life far from home.\n \nLauren has sustained severe injuries, including a traumatic brain injury along with numerous fractures, necessitating multiple surgeries and intensive care. Currently, she is in a medically induced coma, a step taken by her medial team with the hope of stabilizing her condition enough to bring her back to the United States. The goal is to transfer her to a specialized pediatric ICU trauma unit in Boston, where she can receive the best possible care and embark on the long road to recovery.',
                          style: TextStyle(
                              color: Color.fromARGB(255, 104, 104, 104),
                              fontSize: 14),
                        ),
                      ),
                  ),
                  
                ]),
              ),
            ),
          )),
    );
  }
} */