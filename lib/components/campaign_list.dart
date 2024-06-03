import 'package:flutter/material.dart';

class CampaignList extends StatelessWidget {
  final List<String> campaigns;
  const CampaignList({
    super.key,
    required this.campaigns,
  });


  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        for(var campaign in campaigns)
        ListTile(
          leading: const Icon(Icons.arrow_forward_ios),
          title: Text(campaign),
        ),
      ],
    );
  }
}
