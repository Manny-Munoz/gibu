import "package:flutter/material.dart";
import "package:gibu/components/campaign_preview.dart";
import "package:gibu/components/input_text.dart";
import "package:gibu/components/text_alignment_left.dart";
import "package:gibu/components/social_media_button.dart";
import "package:gibu/components/campaing_structure.dart";

class HomePage extends StatelessWidget {
  final name = "Monika";
  final controller = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextAlignmentLeft(
                text: "Hello, $name 👋",
              ),
              const SizedBox(height: 5),
              const TextAlignmentLeft(
                text: "What do you wanna donate today? 🤔",
                textSize: 12,
              ),
              const SizedBox(height: 20),
              InputText(
                  controller: controller,
                  hintText: "🔎 Search here",
                  obscureText: false),
              const SizedBox(height: 15),
              Container(
                height: 250,
                width: double.maxFinite,
                margin: const EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image:
                        AssetImage("lib/images/create campaign background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Card(
                  color: const Color.fromARGB(0, 58, 44, 44),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Flexible(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Do you really Have \na creative idea?",
                              style: TextStyle(
                                  color: Color.fromARGB(234, 9, 9, 9),
                                  fontSize: 20)),
                        )),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/main'),
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 23, 77, 77),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Start Campaign",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 230, 245, 196),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const TextAlignmentLeft(
                text: "Categories",
              ),
              const SizedBox(height: 15),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    ImageCard(
                      imagePath: "lib/images/medical.png",
                      backgroundColor: Color.fromARGB(155, 52, 145, 230),
                      borderColor: Color.fromARGB(255, 52, 145, 230),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Medical",
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    ImageCard(
                      imagePath: "lib/images/educational.png",
                      backgroundColor: Color.fromARGB(155, 37, 158, 164),
                      borderColor: Color.fromARGB(255, 37, 158, 164),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Educational",
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    ImageCard(
                      imagePath: "lib/images/non-profit.png",
                      backgroundColor: Color.fromARGB(155, 255, 153, 0),
                      borderColor: Color.fromARGB(255, 255, 153, 0),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Non-profit",
                    ),
                  ],
                ),
              ]),
              const SizedBox(height: 25),
              const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: [
                        CampaignPreview(
                          campaingTitlePreview:
                              "Bring Lauren home: Fund for Med-Flight & recovery hello how are",
                          imagePathPreview: "lib/images/Lauren.png",
                          heroPathPreview: "lib/images/profile.png",
                          fundraiserNamePreview: "Monika Islam",
                          raisedPreview: 131234.00,
                          goalPreview: 250000.00,
                          descriptionPreview:
                              "Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me.",
                        ),
                        SizedBox(height: 20),
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
                        SizedBox(height: 20),
                        CampaignPreview(
                          campaingTitlePreview:
                              "Bring Lauren home: Fund for Med-Flight & recovery hello how are",
                          imagePathPreview: "lib/images/Lauren.png",
                          heroPathPreview: "lib/images/profile.png",
                          fundraiserNamePreview: "Monika Islam",
                          raisedPreview: 400000.00,
                          goalPreview: 250000.00,
                          descriptionPreview:
                              "Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me. Today I reach out to you with a heavy heart, asking for your help during an unimaginably difficult time for a family very near and dear to me.",
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
