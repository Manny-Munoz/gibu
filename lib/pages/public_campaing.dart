import 'package:flutter/material.dart';
import "package:gibu/components/campaign_preview.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class PublicCampaing extends StatelessWidget {
  const PublicCampaing({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("campaigns").snapshots(),
        builder: (context, snapshot) {
          int counter = 0;
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 17.0),
                  child: Text(
                    "No campaign available",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
            return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final campaign = snapshot.data!.docs[index];
                  final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
                  if (campaign['likes'].contains(currentUserUid)) {
                    return CampaignPreview(
                      campaignId: campaign.id,
                      campaingTitlePreview: campaign['title'],
                      imagePathPreview: campaign['image'],
                      heroPathPreview: campaign['hero'],
                      fundraiserNamePreview: campaign['fundraiser'],
                      raisedPreview: (campaign['raised'] as num).toDouble(),
                      goalPreview: (campaign['goal'] as num).toDouble(),
                      descriptionPreview: campaign['description'],
                      likes: List<String>.from(campaign['likes'] ?? []),
                      type: campaign['type'],
                    );
                  } else {
                    counter += 1;
                    if (counter == snapshot.data!.docs.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 17.0),
                          child: Text(
                            "No saved available",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }
                    return Container();
                  }
                });
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
